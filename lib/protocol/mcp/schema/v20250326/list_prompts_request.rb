# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ListPromptsRequest extends PaginatedRequest {
#   method: "prompts/list";
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Sent from the client to request a list of prompts and prompt templates the server has.
  class ListPromptsRequest < PaginatedRequest
    include Protocol::Mcp::Schema::Type
    include ClientRequest

    def initialize(**params)
      super(method: "prompts/list", params:)
    end
  end
end