#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'
require 'fileutils'

# This script parses a JSON schema file generated from TypeScript AST
# and creates Ruby classes and modules that match the schema structure.

class SchemaGenerator
  # These become modules that get mixed into the generated classes
  MODULES = %w[Request Notification Response Error Result PaginatedRequest PaginatedResult].freeze

  class Indented
    def initialize(lines)
      @lines = lines
    end

    def <<(line)
      if line.empty?
        @lines << ""
      else
        @lines << "  #{line}"
      end
    end
  end

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
      interface = Interface.new(item, type_aliases:)
      interface.generate
      @generated_files << interface.write(@output_dir)
    end

    # Generate index file that requires all generated files
    generate_index_file(@generated_files)
  end

  def generate_index_file(files)
    index_content = []
    index_content << "# frozen_string_literal: true"
    index_content << ""
    index_content << "# This file is auto-generated. Do not edit it manually."
    index_content << ""

    @generated_files.each do |file_path|
      relative_path = file_path.sub("#{@output_dir}/", "").sub(".rb", "")
      index_content << "require_relative '#{relative_path}'"
    end

    File.write(File.join(@output_dir, "index.rb"), index_content.join("\n"))
  end

  class SchemaType
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
    def generate_class(ruby_code, name, comment, &block)
      generate_code_block(ruby_code, "class #{name}", comment:, &block)
    end

    def generate_module(ruby_code, name, comment, &block)
      generate_code_block(ruby_code, "module #{name}", comment:, &block)
    end

    def generate_method(ruby_code, name, params = nil, &block)
      params_str = "(#{params&.join(', ')})" if params
      header = "def #{name}#{params_str}"
      generate_code_block(ruby_code, header, &block)
    end

    def generate_multiline_hash(ruby_code, name, hash)
      ruby_code << "#{name} = {"
      begin
        indented = Indented.new(ruby_code)
        hash.each { |prop| indented << prop }
      end
      ruby_code << "}"
    end

    def generate_code_block(ruby_code, header, comment: nil, &block)
      generate_comment(ruby_code, comment) if comment
      ruby_code << header
      yield Indented.new(ruby_code) if block_given?
      ruby_code << "end"
    end

    def extract_params_properties(params_member)
      return [] unless params_member && params_member.dig('typeNode', 'kind') == 'TypeLiteral'

      members = params_member.dig('typeNode', 'members')
      return [] unless members

      members.filter_map do |param_member|
        # Skip _meta and any index signature ([key: string]: unknown)
        next if param_member[:name] == '_meta' || param_member[:name].start_with?('[')

        comment = param_member[:comment] || ''
        comment_tags = param_member[:comment_tags]
        optional = param_member[:optional] || false
        comment, default = extract_default(comment) if optional

        {
          name: convert_param_name(param_member[:name]),
          original_name: param_member[:name],
          type: extract_type(param_member),
          comment:,
          comment_tags:,
          optional:,
          default:,
        }
      end
    end

    def extract_direct_properties(ast_structure)
      return [] if ast_structure[:members].empty?

      ast_structure[:members].filter_map do |member|
        # Skip _meta
        next if member[:name] == '_meta' || member[:name].start_with?('[')
        next if member[:name] == 'params'

        name = member[:name]
        original_name = name
        type = extract_type(member)
        comment = member[:comment] || ''
        optional = member[:optional] || false
        comment, default = extract_default(comment) if optional
        comment_tags = member[:comment_tags]

        { name:, original_name:, optional:, type:, comment:, comment_tags:, default: }
      end
    end

    # Always return a default value, using 'nil' if no default is found
    # You must use the optional keyword to determine if the default should be used
    def extract_default(comment)
      default = comment.lines(chomp: true).find { |line| line.start_with?('Default:') }
      if default
        default = default.gsub('Default: ', '')
        comment = comment.lines(chomp: true).reject { |line| line.start_with?('Default:') }.join("\n")
        [comment, default]
      else
        [comment, 'nil']
      end
    end

    def extract_type(member)
      type_node = member[:typeNode]
      return map_type_to_ruby(member[:type]) unless type_node

      case type_node[:kind]
      when 'SimpleType'
        map_type_to_ruby(type_node[:text])
      when 'TypeLiteral'
        if type_node[:members] && !type_node[:members].empty?
          # For complex types like { [key: string]: unknown }
          if type_node[:text] && type_node[:text].include?('[key: string]')
            'Hash'
          else
            'Hash'
          end
        else
          'Hash'
        end
      when 'LiteralType'
        type_node[:literal].gsub('"', '')
      when 'ArrayType'
        "Array<#{extract_parameterized_types(type_node).join(', ')}>"
      when 'UnionType'
        "Type<#{extract_parameterized_types(type_node).join(', ')}>"
      when 'TypeReference'
        type_node[:typeName]
      else
        map_type_to_ruby(member[:type])
      end
    end

    # Examples:
    #
    # "elementType": {
    #   "kind": "SimpleType",
    #   "text": "(JSONRPCRequest | JSONRPCNotification)"
    # }
    #
    # "kind": "ArrayType",
    # "elementType": {
    #   "kind": "TypeReference",
    #   "typeName": "Root",
    #   "typeArguments": []
    # }
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

    def convert_param_name(str)
      # Convert camelCase to snake_case and handle special cases
      snake_case_str = str.gsub(/([a-z])([A-Z])/, '\1_\2').downcase

      # Handle special cases like "protocolVersion" to "protocol_version"
      snake_case_str
    end

    def generate_comment(ruby_code, comment)
      return if comment.nil? || comment.empty?

      comment.lines(chomp: true).each do |line|
        ruby_code << "# #{line}"
      end
    end

    def generate_param_comment(ruby_code, name:, type:, original_name: nil, comment: '', comment_tags: nil, optional: false, default: 'nil')
      lines = comment.lines(chomp: true)
      lines.reject!(&:empty?) # Empty lines look weird on @param comments

      # Sometimes put the original comment on the same line as the @param but only if it's short
      first_line = lines.shift if lines.first && lines.first.length < 50
      default_str = "(#{default})" if optional

      generate_comment(ruby_code, ["@param", name, "[#{type}]", default_str, first_line].compact.join(' '))

      # Most of the comment lines are too long to look good.
      # Example:
      # @param name [Type] (nil)
      #   First line
      #   Continuation line
      lines.each do |line|
        generate_comment(ruby_code, "  #{line}")
      end

      generate_comment_tags(ruby_code, comment_tags) if comment_tags
    end

    def generate_comment_tags(ruby_code, comment_tags)
      comment_tags.each do |tag|
        next if tag[:tag] == "TJS-type" # these don't add much.
        generate_comment(ruby_code, "  @#{tag[:tag]} #{tag[:comment]}")
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
  class TypeAlias < SchemaType
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

  class Interface < SchemaType
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
        params_member = nil

        ast_structure[:members].each do |member|
          if member[:name] == 'method' && member.dig(:typeNode, :kind) == 'LiteralType'
            method_value = member.dig(:typeNode, :literal).gsub('"', '')
          elsif member[:name] == 'params'
            params_member = member
          end
        end

        # Extract params properties if available
        params_properties = extract_params_properties(params_member)

        # For Result types, extract direct properties (not in params)
        direct_properties = extract_direct_properties(ast_structure) if base_type == 'Result' || base_type == 'PaginatedResult'

        # Add initialize method
        if !params_properties.empty?
          # For classes with params properties, create an initialize method that accepts each property
          initialize_params = []
          instance_vars = []
          params_hash = {}
          # Add comments and parameters for each property in params
          params_properties.each do |prop|
            param_name = prop[:name]
            original_name = prop[:original_name]
            param_type = prop[:type]
            default = prop[:default]
            optional = prop[:optional]
            generate_param_comment(indented, **prop)

            if optional
              initialize_params << "#{param_name}: #{default}"
            else
              initialize_params << "#{param_name}:"
            end

            instance_vars << "@#{param_name} = #{param_name}"
            params_hash[original_name] = param_name
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
        elsif (base_type == 'Result' || base_type == 'PaginatedResult') && !direct_properties.empty?
          # For Result types with direct properties
          initialize_params = []
          instance_vars = []
          result_hash = {}

          # Add comments and parameters for each direct property
          direct_properties.each do |prop|
            param_name = prop[:name]
            original_name = prop[:original_name]
            generate_param_comment(indented, **prop)

            if prop[:optional]
              initialize_params << "#{param_name}: nil"
            else
              initialize_params << "#{param_name}:"
            end

            instance_vars << "@#{param_name} = #{param_name}"
            result_hash[original_name] = param_name
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
        method_value = nil
        params_member = nil

        ast_structure[:members].each do |member|
          if member[:name] == 'method' && member.dig(:typeNode, :kind) == 'LiteralType'
            method_value = member.dig(:typeNode, :literal).gsub('"', '')
          elsif member[:name] == 'params'
            params_member = member
          end
        end

        params_properties = extract_params_properties(params_member)
        direct_properties = extract_direct_properties(ast_structure)

        params = []

        direct_properties.each do |prop|
          member_name = prop[:name]
          optional = prop[:optional]
          default = prop[:default]
          # Add parameter comment
          generate_param_comment(indented, **prop)

          # Add parameter to initialize method
          if optional
            params << "#{member_name}: #{default}"
          else
            params << "#{member_name}:"
          end
        end

        generate_method(indented, 'initialize', params) do |indented2|
          # Add instance variable assignments
          direct_properties.each do |prop|
            member_name = prop[:name]
            indented2 << "@#{member_name} = #{member_name}"
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

# Main execution
if __FILE__ == $PROGRAM_NAME
  if ARGV.length < 2
    puts "Usage: #{$PROGRAM_NAME} <json_file_path> <output_directory>"
    exit 1
  end

  json_file_path = ARGV[0]
  output_dir = ARGV[1]

  generator = SchemaGenerator.new(json_file_path, output_dir)
  generator.generate
  puts "Schema generation complete. Output directory: #{output_dir}"
end
