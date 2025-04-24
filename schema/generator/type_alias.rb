
require_relative 'schema_node'

module Schema
  class Generator
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
  end
end
