require_relative 'indented'
require_relative 'member'
require_relative 'ruby_type'

# This script parses a JSON schema file generated from TypeScript AST
# and creates Ruby classes and modules that match the schema structure.

module Schema
  class Generator
    class SchemaNode
      include RubyType

      # These become modules that get mixed into the generated classes
      MODULES = %w[Request Notification Response Error].freeze

      attr_reader :item
      attr_reader :ruby_code
      attr_reader :module_scope
      attr_reader :skipped

      def initialize(item, module_scope:, **)
        @item = item
        @ruby_code = []
        @module_scope = module_scope
        @skipped = false
      end

      def name = @item[:name]
      def comment = @item[:comment]
      def comment_tags = @item[:comment_tags]
      def node_text = @item[:nodeText]
      def ast_structure = @item[:astStructure]
      def kind = ast_structure[:kind]
      def type_node = ast_structure[:typeNode]

      def generate(&)
        return unless ast_structure

        generate_comment(ruby_code, "frozen_string_literal: true")
        ruby_code << ""

        # Add the original TypeScript code as a comment
        generate_comment(ruby_code, "Translated from original TypeScript source:\n\n```ts\n#{node_text}\n```\n")

        # Add version module wrapper
        RubyType.generate_module(ruby_code, module_scope, &)
      end

      def write(output_dir)
        # Don't write files that were skipped during generation
        return nil if @skipped

        # Write the generated code to a file
        file_path = File.join(output_dir, "#{snake_case(name)}.rb")
        File.write(file_path, ruby_code.join("\n"))
        file_path
      end

      # Common utility methods used by both subclasses


      def extract_parameterized_types(type_node)
        case type_node[:kind]
        when 'ArrayType'
          extract_element_types(type_node[:elementType])
        when 'UnionType'
          type_node[:types].flat_map { |type| extract_element_types(type) }
        end
      end

      def extract_element_types(type_node)
        case type_node[:kind]
        when 'SimpleType'
          type_node[:text].tr('()', '').split(' | ').map { |t| map_type_to_ruby(t) }
        when 'TypeReference'
          [type_node[:typeName]]
        when 'LiteralType'
          [type_node[:literal]]
        when 'UnionType'
          type_node[:types].flat_map { |type| extract_element_types(type) }
        else
          raise "unknown element type: #{type_node[:kind]}"
        end
      end

      def map_type_to_ruby(type)
        return 'Object' if type.nil?

        case type
        when 'typeof JSONRPC_VERSION'
          'JSONRPC_VERSION'
        when 'string'
          'String'
        when 'number'
          'Numeric'
        when 'boolean'
          'Boolean'
        when 'any'
          'Object'
        when 'unknown'
          'Object'
        else
          if type.include?('{') && type.include?('}')
            'Hash'
          elsif type.include?('[') && type.include?(']')
            'Array'
          else
            type
          end
        end
      end
    end
  end
end
