# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface SamplingMessage {
#   role: Role;
#   content: TextContent | ImageContent;
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Describes a message issued to or received from an LLM API.
  class SamplingMessage

    attr_reader :role

    attr_reader :content

    def initialize(role:, content:)
      @role = role
      @content = content
    end
  end
end