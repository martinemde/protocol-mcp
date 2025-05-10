module Schema
  class Generator
    module RubyType
      module_function

      def from(type:, type_node: nil)
        return map_type_to_ruby(type) unless type_node

        case type_node[:kind]
        when 'SimpleType'
          map_type_to_ruby(type_node[:text])
        when 'TypeLiteral'
          if type_node[:members] && !type_node[:members].empty?
            'Hash'
          else
            'Hash'
          end
        when 'LiteralType'
          type_node[:literal].gsub('"', '')
        when 'ArrayType'
          element_type = process_type_node(type_node[:elementType])
          "Array<#{element_type}>"
        when 'UnionType'
          types = type_node[:types].map { |t| process_type_node(t) }
          types.join(', ')
        when 'TypeReference'
          type_node[:typeName]
        else
          map_type_to_ruby(type)
        end
      end

      def process_type_node(node)
        case node[:kind]
        when 'SimpleType'
          map_type_to_ruby(node[:text])
        when 'TypeReference'
          node[:typeName]
        when 'LiteralType'
          node[:literal].gsub('"', '')
        when 'UnionType'
          types = node[:types].map { |t| process_type_node(t) }
          types.join(' | ')
        when 'ArrayType'
          element_type = process_type_node(node[:elementType])
          "Array<#{element_type}>"
        else
          map_type_to_ruby(node[:text] || 'Object')
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

      # Ruby code generation utilities
      def generate_module(ruby_code, name, comment = nil, &block)
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

      def snake_case(str)
        str.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
      end

      def camelize(str)
        str.split('_').map(&:capitalize).join
      end
    end
  end
end
