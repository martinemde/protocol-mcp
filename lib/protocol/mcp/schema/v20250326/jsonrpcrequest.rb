# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface JSONRPCRequest extends Request {
#   jsonrpc: typeof JSONRPC_VERSION;
#   id: RequestId;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # A request that expects a response.
  class JSONRPCRequest < Request
    include JSONRPCMessage
    include JSONRPCBatchRequest

    attr_reader :jsonrpc

    attr_reader :id

    def initialize(jsonrpc:, id:, **kwargs)
      @jsonrpc = jsonrpc
      @id = id
      super(jsonrpc: jsonrpc, id: id, **kwargs)
    end
  end
end