# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface JSONRPCError {
#   jsonrpc: typeof JSONRPC_VERSION;
#   id: RequestId;
#   error: {
#     /**
#      * The error type that occurred.
#      */
#     code: number;
#     /**
#      * A short description of the error. The message SHOULD be limited to a concise single sentence.
#      */
#     message: string;
#     /**
#      * Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
#      */
#     data?: unknown;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # A response to a request that indicates an error occurred.
  class JSONRPCError
    include JSONRPCMessage

    attr_reader :jsonrpc

    attr_reader :id

    attr_reader :error

    def initialize(jsonrpc:, id:, error:)
      @jsonrpc = jsonrpc
      @id = id
      @error = error
    end
  end
end