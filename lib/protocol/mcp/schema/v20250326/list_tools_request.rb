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
    include Protocol::Mcp::Schema::Type
    include ClientRequest

    METHOD = "tools/list"

    def initialize(**params)
      super(method: METHOD, params:)
    end
  end
end