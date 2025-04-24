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
    def initialize(json_file_path, output_dir)
      @json_file_path = json_file_path
      @output_dir = output_dir
      @schema_data = JSON.parse(File.read(json_file_path), symbolize_names: true)
      @generated_files = []
    end

    def generate
      # Create output directory if it doesn't exist
      FileUtils.mkdir_p(@output_dir)

      interfaces, type_aliases = @schema_data.partition do |item|
        item[:astStructure][:kind] == 'Interface'
      end

      # First, build a map of all interfaces
      interface_map = interfaces.each_with_object({}) do |item, map|
        map[item[:name]] = {
          item: item,
          extended_by: []
        }
      end

      # Identify which interfaces are extended by others
      interfaces.each do |item|
        extends = item.dig(:astStructure, :extends)
        next unless extends && !extends.empty?

        extends.each do |extended_interface|
          # Skip if it's extending a standard module like Request
          next if SchemaNode::MODULES.include?(extended_interface)

          interface_map[extended_interface][:extended_by] << item[:name] if interface_map[extended_interface]
        end
      end

      # Now classify each interface as either a module (if extended by others) or a class (if not)
      interface_map.each do |name, info|
        info[:is_module] = !info[:extended_by].empty?
      end

      # Print out the classification for debugging
      puts "Interface Classification:"
      interface_map.each do |name, info|
        puts "  #{name}: #{info[:is_module] ? 'Module' : 'Class'}"
        if info[:is_module]
          puts "    Extended by: #{info[:extended_by].join(', ')}"
        end
      end

      type_alias_index = {}

      type_aliases.each do |item|
        type_alias = TypeAlias.new(item)
        type_alias.generate

        type_alias.member_names&.each do |member|
          type_alias_index[member] ||= []
          type_alias_index[member] << type_alias.name
        end
        @generated_files << type_alias.write(@output_dir)
      end

      interfaces.each do |item|
        type_aliases = type_alias_index.fetch(item[:name], [])
        is_module = interface_map[item[:name]][:is_module]
        interface = Interface.new(item, type_aliases: type_aliases, force_module: is_module)
        interface.generate
        @generated_files << interface.write(@output_dir)
      end

      # Generate index file that requires all generated files
      generate_index_file(@generated_files, @output_dir)
    end

    def generate_index_file(files, output_dir)
      index_content = []
      index_content << "# frozen_string_literal: true"
      index_content << ""
      index_content << "# This file is auto-generated. Do not edit it manually."
      index_content << ""

      files.each do |file_path|
        relative_path = file_path.sub("#{output_dir}/", "").sub(".rb", "")
        index_content << "require_relative '#{relative_path}'"
      end

      File.write(File.join(output_dir, "index.rb"), index_content.join("\n"))
    end
  end
end
