# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface PromptMessage {
#   role: Role;
#   content: TextContent | ImageContent | EmbeddedResource;
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Describes a message returned as part of a prompt.
  # 
  # This is similar to `SamplingMessage`, but also supports the embedding of
  # resources from the MCP server.
  class PromptMessage

    attr_reader :role

    attr_reader :content

    def initialize(role:, content:)
      @role = role
      @content = content
    end
  end
end