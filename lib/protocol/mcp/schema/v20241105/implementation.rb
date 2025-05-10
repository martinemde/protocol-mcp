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

    attr_reader :name

    attr_reader :version

    def initialize(name:, version:)
      @name = name
      @version = version
    end
  end
end