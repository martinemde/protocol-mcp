# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ListPromptsResult extends PaginatedResult {
#   prompts: Prompt[];
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # The server's response to a prompts/list request from the client.
  class ListPromptsResult < PaginatedResult
    include ServerResult

    attr_reader :prompts

    def initialize(prompts:, **kwargs)
      @prompts = prompts
      super(**kwargs)
    end
  end
end