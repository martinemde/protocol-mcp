# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface InitializeRequest extends Request {
#   method: "initialize";
#   params: {
#     /**
#      * The latest version of the Model Context Protocol that the client supports. The client MAY decide to support older versions as well.
#      */
#     protocolVersion: string;
#     capabilities: ClientCapabilities;
#     clientInfo: Implementation;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # This request is sent from the client to the server when it first connects, asking it to begin initialization.
  class InitializeRequest < Request
    include ClientRequest

    # The latest version of the Model Context Protocol that the client supports. The client MAY decide to support older versions as well.
    attr_reader :protocol_version

    attr_reader :capabilities

    attr_reader :client_info

    # @param protocol_version [String]
    #   The latest version of the Model Context Protocol that the client supports. The client MAY decide to support older versions as well.
    def initialize(protocol_version:, capabilities:, client_info:)
      @protocol_version = protocol_version
      @capabilities = capabilities
      @client_info = client_info
      params = {
        protocolVersion: protocol_version,
        capabilities: capabilities,
        clientInfo: client_info,
      }
      super(method: "initialize", params:)
    end
  end
end