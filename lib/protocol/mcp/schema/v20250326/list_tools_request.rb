# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ListToolsRequest extends PaginatedRequest {
#   method: "tools/list";
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Sent from the client to request a list of tools the server has.
  class ListToolsRequest < PaginatedRequest
    include ClientRequest

    def initialize(**params)
      super(method: "tools/list", params:)
    end
  end
end