#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'
require 'fileutils'

require_relative 'generator/indented'
require_relative 'generator/member'
require_relative 'generator/schema_node'
require_relative 'generator/type_alias'
require_relative 'generator/interface'
require_relative 'generator/ruby_type'

# This script parses a JSON schema file generated from TypeScript AST
# and creates Ruby classes and modules that match the schema structure.

module Schema
  class Generator
    # @param json_file_path The path to the JSON schema file
    # @param output_dir The directory to output the generated files
    # @param version The version of the schema, e.g. "2025-03-26"
    def initialize(json_file_path:, output_dir:, version:, scope:, lib_root: "lib")
      @version = version
      @version_module = "V#{version.gsub('-', '')}"
      @lib_root = lib_root
      @output_root = output_dir
      @output_dir = File.join(output_dir, @version_module.downcase)
      @schema_data = JSON.parse(File.read(json_file_path), symbolize_names: true)
      @generated_files = {}
      @scope = scope
    end

    def clean
      FileUtils.rm_rf(@output_dir)
      FileUtils.rm_rf(index_file_path)
    end

    def generate
      FileUtils.mkdir_p(@output_dir)

      interfaces, type_aliases = partition_schema_items
      interface_map = build_interface_map(interfaces)
      type_alias_index = process_type_aliases(type_aliases)
      process_interfaces(interfaces, interface_map, type_alias_index)
      generate_index_file
    end

    private

    def index_file_path
      File.join(@output_root, "#{@version_module.downcase}.rb")
    end

    def partition_schema_items
      @schema_data.partition { |item| item[:astStructure][:kind] == 'Interface' }
    end

    def build_interface_map(interfaces)
      map = initialize_interface_map(interfaces)
      analyze_interface_extensions(interfaces, map)
      classify_interfaces(map)
      log_interface_classification(map)
      map
    end

    def initialize_interface_map(interfaces)
      interfaces.each_with_object({}) do |item, map|
        map[item[:name]] = {
          item: item,
          extended_by: []
        }
      end
    end

    def analyze_interface_extensions(interfaces, map)
      interfaces.each do |item|
        extends = item.dig(:astStructure, :extends)
        next unless extends && !extends.empty?

        extends.each do |extended_interface|
          next if SchemaNode::MODULES.include?(extended_interface)
          map[extended_interface][:extended_by] << item[:name] if map[extended_interface]
        end
      end
    end

    def classify_interfaces(map)
      map.each do |name, info|
        info[:is_module] = !info[:extended_by].empty?
      end
    end

    def log_interface_classification(map)
      puts "Interface Classification:"
      map.each do |name, info|
        puts "  #{name}: #{info[:is_module] ? 'Module' : 'Class'}"
        if info[:is_module]
          puts "    Extended by: #{info[:extended_by].join(', ')}"
        end
      end
    end

    def process_type_aliases(type_aliases)
      type_aliases.each_with_object({}) do |item, index|
        module_scope = "#{@scope}::#{@version_module}"
        type_alias = TypeAlias.new(item, module_scope:)
        type_alias.generate
        index_type_alias(type_alias, index)
        @generated_files[type_alias.name] = type_alias.write(@output_dir)
      end
    end

    def index_type_alias(type_alias, index)
      type_alias.member_names&.each do |member|
        index[member] ||= []
        index[member] << type_alias.name
      end
    end

    def process_interfaces(interfaces, interface_map, type_alias_index)
      interfaces.each do |item|
        type_aliases = type_alias_index.fetch(item[:name], [])
        is_module = interface_map[item[:name]][:is_module]
        module_scope = "#{@scope}::#{@version_module}"
        interface = Interface.new(item, type_aliases:, force_module: is_module, module_scope:)
        interface.generate
        @generated_files[interface.name] = interface.write(@output_dir)
      end
    end

    def generate_index_file
      index_content = [
        "# frozen_string_literal: true",
        "",
      ]

      RubyType.generate_module(index_content, @scope, "This file is auto-generated. Do not edit it manually.") do |indented|
        RubyType.generate_module(indented, @version_module) do |indented2|
          @generated_files.sort_by { |name, _| name }.each do |name, file_path|
            relative_path = file_path.sub("#{@lib_root}/", "").sub(".rb", "")
            indented2 << "autoload :#{name}, '#{relative_path}'"
          end
        end
      end

      File.write(index_file_path, index_content.join("\n"))
    end
  end
end
