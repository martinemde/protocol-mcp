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
    include Protocol::Mcp::Schema::Type

    schema_attribute :role

    schema_attribute :content

    attr_reader :attributes

    def initialize(role:, content:, **kwargs)
      @attributes = { role: role, content: content }.merge(kwargs)
    end
  end
end