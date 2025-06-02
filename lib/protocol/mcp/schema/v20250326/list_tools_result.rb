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
    include ServerResult

    attr_reader :tools

    def initialize(tools:, **kwargs)
      @tools = tools
      super(tools: tools, **kwargs)
    end
  end
end