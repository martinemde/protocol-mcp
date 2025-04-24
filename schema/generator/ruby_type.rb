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

    end
  end
end
