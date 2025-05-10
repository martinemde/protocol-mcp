# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface JSONRPCResponse {
#   jsonrpc: typeof JSONRPC_VERSION;
#   id: RequestId;
#   result: Result;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # A successful (non-error) response to a request.
  class JSONRPCResponse
    include JSONRPCMessage
    include JSONRPCBatchResponse

    attr_reader :jsonrpc

    attr_reader :id

    attr_reader :result

    def initialize(jsonrpc:, id:, result:)
      @jsonrpc = jsonrpc
      @id = id
      @result = result
    end
  end
end