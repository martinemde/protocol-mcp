# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface JSONRPCNotification extends Notification {
#   jsonrpc: typeof JSONRPC_VERSION;
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # A notification which does not expect a response.
  class JSONRPCNotification < Notification
    include JSONRPCMessage

    attr_reader :jsonrpc

    def initialize(jsonrpc:, **kwargs)
      @jsonrpc = jsonrpc
      super(**kwargs)
    end
  end
end