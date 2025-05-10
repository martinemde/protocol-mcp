# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface PingRequest extends Request {
#   method: "ping";
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # A ping, issued by either the server or the client, to check that the other party is still alive. The receiver must promptly respond, or else may be disconnected.
  class PingRequest < Request
    include ClientRequest
    include ServerRequest

    def initialize(**params)
      super(method: "ping", params:)
    end
  end
end