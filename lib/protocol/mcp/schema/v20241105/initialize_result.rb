# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface InitializeResult extends Result {
#   /**
#    * The version of the Model Context Protocol that the server wants to use. This may not match the version that the client requested. If the client cannot support this version, it MUST disconnect.
#    */
#   protocolVersion: string;
#   capabilities: ServerCapabilities;
#   serverInfo: Implementation;
#   /**
#    * Instructions describing how to use the server and its features.
#    *
#    * This can be used by clients to improve the LLM's understanding of available tools, resources, etc. It can be thought of like a "hint" to the model. For example, this information MAY be added to the system prompt.
#    */
#   instructions?: string;
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # After receiving an initialize request from the client, the server sends this response.
  class InitializeResult < Result
    include Protocol::Mcp::Schema::Type
    include ServerResult

    # The version of the Model Context Protocol that the server wants to use. This may not match the version that the client requested. If the client cannot support this version, it MUST disconnect.
    schema_attribute :protocol_version

    schema_attribute :capabilities

    schema_attribute :server_info

    # Instructions describing how to use the server and its features.
    # 
    # This can be used by clients to improve the LLM's understanding of available tools, resources, etc. It can be thought of like a "hint" to the model. For example, this information MAY be added to the system prompt.
    schema_attribute :instructions, optional: true

    # @param protocol_version [String]
    #   The version of the Model Context Protocol that the server wants to use. This may not match the version that the client requested. If the client cannot support this version, it MUST disconnect.
    # @param instructions [String] (nil)
    #   Instructions describing how to use the server and its features.
    #   This can be used by clients to improve the LLM's understanding of available tools, resources, etc. It can be thought of like a "hint" to the model. For example, this information MAY be added to the system prompt.
    def initialize(protocol_version:, capabilities:, server_info:, instructions: nil, **kwargs)
      super(protocol_version: protocol_version, capabilities: capabilities, server_info: server_info, instructions: instructions, **kwargs)
    end
  end
end