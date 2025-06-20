# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ListResourcesRequest extends PaginatedRequest {
#   method: "resources/list";
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Sent from the client to request a list of resources the server has.
  class ListResourcesRequest < PaginatedRequest
    include Protocol::Mcp::Schema::Type
    include ClientRequest

    METHOD = "resources/list"

    def initialize(**params)
      super(method: METHOD, params:)
    end
  end
end