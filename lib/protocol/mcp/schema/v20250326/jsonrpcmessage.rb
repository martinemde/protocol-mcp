# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export type JSONRPCMessage =
#   | JSONRPCRequest
#   | JSONRPCNotification
#   | JSONRPCBatchRequest
#   | JSONRPCResponse
#   | JSONRPCError
#   | JSONRPCBatchResponse;
# ```
module Protocol::Mcp::Schema::V20250326
  # Refers to any valid JSON-RPC object that can be decoded off the wire, or encoded to be sent.
  module JSONRPCMessage
    # Type alias: | JSONRPCRequest
    #   | JSONRPCNotification
    #   | JSONRPCBatchRequest
    #   | JSONRPCResponse
    #   | JSONRPCError
    #   | JSONRPCBatchResponse
  end
end