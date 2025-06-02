# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ListToolsResult extends PaginatedResult {
#   tools: Tool[];
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # The server's response to a tools/list request from the client.
  class ListToolsResult < PaginatedResult
    include Protocol::Mcp::Schema::Type
    include ServerResult

    schema_attribute :tools

    def initialize(tools:, **kwargs)
      super(tools: tools, **kwargs)
    end
  end
end