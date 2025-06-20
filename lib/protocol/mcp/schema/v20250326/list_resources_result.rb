# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ListResourcesResult extends PaginatedResult {
#   resources: Resource[];
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # The server's response to a resources/list request from the client.
  class ListResourcesResult < PaginatedResult
    include Protocol::Mcp::Schema::Type
    include ServerResult

    schema_attribute :resources

    def initialize(resources:, **kwargs)
      super(resources: resources, **kwargs)
    end
  end
end