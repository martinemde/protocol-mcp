# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ListResourcesRequest extends PaginatedRequest {
#   method: "resources/list";
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Sent from the client to request a list of resources the server has.
  class ListResourcesRequest < PaginatedRequest
    include ClientRequest

    def initialize(**params)
      super(method: "resources/list", params:)
    end
  end
end