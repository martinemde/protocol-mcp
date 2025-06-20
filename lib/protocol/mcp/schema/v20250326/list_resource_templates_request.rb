# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ListResourceTemplatesRequest extends PaginatedRequest {
#   method: "resources/templates/list";
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Sent from the client to request a list of resource templates the server has.
  class ListResourceTemplatesRequest < PaginatedRequest
    include Protocol::Mcp::Schema::Type

    METHOD = "resources/templates/list"

    def initialize(**params)
      super(method: METHOD, params:)
    end
  end
end