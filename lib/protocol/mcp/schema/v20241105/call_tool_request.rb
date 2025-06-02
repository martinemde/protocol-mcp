# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface CallToolRequest extends Request {
#   method: "tools/call";
#   params: {
#     name: string;
#     arguments?: { [key: string]: unknown };
#   };
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Used by the client to invoke a tool provided by the server.
  class CallToolRequest < Request
    include Protocol::Mcp::Schema::Type
    include ClientRequest

    schema_attribute :name

    schema_attribute :arguments

    def initialize(name:, arguments: nil)
      params = {
        name: name,
        arguments: arguments,
      }
      super(method: "tools/call", params:)
    end
  end
end