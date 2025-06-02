# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface Implementation {
#   name: string;
#   version: string;
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Describes the name and version of an MCP implementation.
  class Implementation
    include Protocol::Mcp::Schema::Type

    schema_attribute :name

    schema_attribute :version

    attr_reader :attributes

    def initialize(name:, version:, **kwargs)
      @attributes = { name: name, version: version }.merge(kwargs)
    end
  end
end