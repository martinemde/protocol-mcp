require_relative 'indented'
require_relative 'member'

# This script parses a JSON schema file generated from TypeScript AST
# and creates Ruby classes and modules that match the schema structure.

module Schema
  class Generator
    class SchemaNode
      # These become modules that get mixed into the generated classes
      MODULES = %w[Request Notification Response Error Result PaginatedRequest PaginatedResult].freeze

      attr_reader :item
      attr_reader :ruby_code

      def initialize(item, **)
        @item = item
        @ruby_code = []
      end

      def name = @item[:name]
      def comment = @item[:comment]
      def comment_tags = @item[:comment_tags]
      def node_text = @item[:nodeText]
      def ast_structure = @item[:astStructure]
      def kind = ast_structure[:kind]
      def type_node = ast_structure[:typeNode]

      def generate
        return unless ast_structure

        generate_comment(ruby_code, "frozen_string_literal: true")
        ruby_code << ""

        # Add the original TypeScript code as a comment
        generate_comment(ruby_code, node_text)
        ruby_code << ""
      end

      def write(output_dir)
        # Write the generated code to a file
        file_path = File.join(output_dir, "#{snake_case(name)}.rb")
        File.write(file_path, ruby_code.join("\n"))
        file_path
      end

      # Common utility methods used by both subclasses

      def generate_module(ruby_code, name, comment, &block)
        generate_code_block(ruby_code, "module #{name}", comment:, &block)
      end

      def generate_method(ruby_code, name, params = nil, &block)
        params_str = "(#{params&.join(', ')})" if params
        header = "def #{name}#{params_str}"
        generate_code_block(ruby_code, header, &block)
      end

      def generate_multiline_hash(ruby_code, name, hash)
        generate_code_block(ruby_code, "#{name} = {", "}") do |indented|
          hash.each { |k, v| indented << "#{k}: #{v}," }
        end
      end

      def generate_code_block(ruby_code, head, foot = "end", comment: nil, &block)
        generate_comment(ruby_code, comment) if comment
        ruby_code << head
        yield Indented.new(ruby_code) if block_given?
        ruby_code << foot
      end

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

      def snake_case(str)
        str.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
      end

      def generate_comment(ruby_code, comment_lines)
        return if comment_lines.nil? || comment_lines.empty?

        comment_lines = comment_lines.lines(chomp: true) unless comment_lines.is_a?(Array)
        comment_lines.each do |line|
          ruby_code << "# #{line}"
        end
      end

      def generate_param_comment(ruby_code, member)
        lines = member.comment_lines.dup
        return if lines.nil? || lines.empty?

        lines.reject!(&:empty?) # Empty lines look weird on @param comments

        # Sometimes put the original comment on the same line as the @param but only if it's short
        first_line = lines.shift if lines.first && lines.first.length < 50
        default_str = "(#{member.default})" if member.optional

        param_comment = ["@param", member.name, "[#{member.type}]", default_str, first_line].compact.join(' ')
        generate_comment(ruby_code, param_comment)

        # Most of the comment lines are too long to look good.
        # Example:
        # @param name [Type] (nil)
        #   First line
        #   Continuation line
        lines.each do |line|
          generate_comment(ruby_code, "  #{line}")
        end

        if member.comment_tags && !member.comment_tags.empty?
          member.comment_tags.each do |tag, comment|
            next if tag == "TJS-type" # these don't add much.
            generate_comment(ruby_code, "  @#{tag} #{comment}")
          end
        end
      end
    end

    # Example TypeAlias
    #
    # {
    #   "name": "JSONRPCBatchRequest",
    #   "comment": "A JSON-RPC batch request, as described in https://www.jsonrpc.org/specification#batch.",
    #   "type": "any",
    #   "nodeText": "export type JSONRPCBatchRequest = (JSONRPCRequest | JSONRPCNotification)[];",
    #   "astStructure": {
    #     "kind": "TypeAlias",
    #     "name": "JSONRPCBatchRequest",
    #     "type": "(JSONRPCRequest | JSONRPCNotification)[]",
    #     "typeNode": {
    #       "kind": "ArrayType",
    #       "elementType": {
    #         "kind": "SimpleType",
    #         "text": "(JSONRPCRequest | JSONRPCNotification)"
    #       }
    #     }
    #   }
    # },
    # {
    #   "name": "JSONRPCBatchResponse",
    #   "comment": "A JSON-RPC batch response, as described in https://www.jsonrpc.org/specification#batch.",
    #   "type": "any",
    #   "nodeText": "export type JSONRPCBatchResponse = (JSONRPCResponse | JSONRPCError)[];",
    #   "astStructure": {
    #     "kind": "TypeAlias",
    #     "name": "JSONRPCBatchResponse",
    #     "type": "(JSONRPCResponse | JSONRPCError)[]",
    #     "typeNode": {
    #       "kind": "ArrayType",
    #       "elementType": {
    #         "kind": "SimpleType",
    #         "text": "(JSONRPCResponse | JSONRPCError)"
    #       }
    #     }
    #   }
    # },
    # {
    #   "name": "ProgressToken",
    #   "comment": "A progress token, used to associate progress notifications with the original request.",
    #   "type": "any",
    #   "nodeText": "export type ProgressToken = string | number;",
    #   "astStructure": {
    #     "kind": "TypeAlias",
    #     "name": "ProgressToken",
    #     "type": "string | number",
    #     "typeNode": {
    #       "kind": "UnionType",
    #       "types": [
    #         {
    #           "kind": "SimpleType",
    #           "text": "string"
    #         },
    #         {
    #           "kind": "SimpleType",
    #           "text": "number"
    #         }
    #       ]
    #     }
    #   }
    # },
    class TypeAlias < SchemaNode
      def initialize(item, **)
        super
        raise "Not a TypeAlias: #{item.inspect}" unless kind == 'TypeAlias'
      end

      def type_node = @item.dig(:astStructure, :typeNode)

      def member_names
        @member_names ||= begin
          extract_parameterized_types(type_node)
        end
      end

      def generate
        super # add comments at top of file

        generate_module(ruby_code, name, comment) do |indented|
          generate_comment(indented, "Type alias: #{ast_structure[:type]}")
        end
      end
    end

    class Interface < SchemaNode
      attr_reader :type_aliases

      def initialize(item, type_aliases: [])
        super(item)
        raise "Not an Interface: #{item.inspect}" unless kind == 'Interface'
        @type_aliases = type_aliases
      end

      def base_type = ast_structure[:extends].first
      def extends_base_type? = MODULES.include?(base_type)

      def generate
        super # add comments at top of file

        if extends_base_type?
          generate_interface_class
        else
          generate_interface_module
        end
      end

      def generate_interface_class
        puts "generating interface class #{name}"

        generate_class(ruby_code, name, comment) do |indented|
          generate_includes(indented)

          # Find method and params from members
          method_value = nil

          ast_structure[:members].each do |member|
            if member[:name] == 'method' && member.dig(:typeNode, :kind) == 'LiteralType'
              method_value = member.dig(:typeNode, :literal).gsub('"', '')
            end
          end

          members = Member.wrap(ast_structure[:members])
          method_value = members[:method]&.literal
          params_members = members[:params]&.members
          # Extract params properties if available

          # Add initialize method
          if !params_members.empty?
            # For classes with params properties, create an initialize method that accepts each property
            initialize_params = []
            instance_vars = []
            params_hash = {}
            # Add comments and parameters for each property in params
            params_members.each do |prop|
              generate_param_comment(indented, prop)

              if prop.optional
                initialize_params << "#{prop.name}: #{prop.default}"
              else
                initialize_params << "#{prop.name}:"
              end

              instance_vars << "@#{prop.name} = #{prop.name}"
              params_hash[prop.original_name] = prop.name
            end

            generate_method(indented, 'initialize', initialize_params) do |indented2|
              # Add instance variable assignments for all params properties
              instance_vars.each { |var| indented2 << var }

              # Create a params hash from the individual properties
              if !params_hash.empty?
                generate_multiline_hash(indented2, 'params', params_hash)
              end

              # Call super with the method and params
              if method_value
                indented2 << "super(method: \"#{method_value}\", params: params)"
              else
                indented2 << "super(params: params)"
              end
            end
          elsif (base_type == 'Result' || base_type == 'PaginatedResult') && !members.empty?
            # For Result types with direct properties
            initialize_params = []
            instance_vars = []
            result_hash = {}

            # Add comments and parameters for each direct property
            members.each do |prop|
              generate_param_comment(indented, prop)

              if prop.optional
                initialize_params << "#{prop.name}: nil"
              else
                initialize_params << "#{prop.name}:"
              end

              instance_vars << "@#{prop.name} = #{prop.name}"
              result_hash[prop.original_name] = prop.name
            end

            # Add initialize method with direct properties as parameters
            generate_method(indented, 'initialize', initialize_params) do |indented2|
              # Add instance variable assignments
              instance_vars.each { |var| indented2 << var }

              # Super call with result data transformed into properties
              if result_hash.empty?
                indented2 << "super()"
              else
                generate_multiline_hash(indented2, 'result', result_hash)
                indented2 << "super(result:)"
              end
            end
          elsif method_value
            # For classes without params properties, create a simple initialize method
            generate_method(indented, 'initialize') do |indented2|
              indented2 << "super(method: \"#{method_value}\")"
            end
          else
            # This means the module just has an include and no methods
            # I'm not sure this is the correct behavior yet.
          end
        end
      end

      def generate_interface_module
        puts "generating interface module #{name}"
        generate_module(ruby_code, name, comment) do |indented|
          generate_includes(indented)

          # Find method and params from members
          members = Member.wrap(ast_structure[:members])
          method_value = members[:method]&.literal
          params_member = members[:params].members

          puts "params_member: #{params_member.inspect}"

          members.each do |prop|
            generate_param_comment(indented, prop)

            # Add parameter to initialize method
            if prop.optional
              params << "#{prop.name}: #{prop.default}"
            else
              params << "#{prop.name}:"
            end
          end

          generate_method(indented, 'initialize', params) do |indented2|
            # Add instance variable assignments
            params_member.each do |prop|
              indented2 << "@#{prop.name} = #{prop.name}"
            end
          end
        end
      end

      def generate_includes(indented)
        indented << "include #{base_type}" if base_type
        type_aliases.each do |type_alias|
          indented << "include #{type_alias}"
        end
        indented << ""
      end
    end
  end
end
