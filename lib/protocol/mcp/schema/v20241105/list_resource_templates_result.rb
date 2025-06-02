# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ListResourceTemplatesResult extends PaginatedResult {
#   resourceTemplates: ResourceTemplate[];
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # The server's response to a resources/templates/list request from the client.
  class ListResourceTemplatesResult < PaginatedResult
    include ServerResult

    attr_reader :resource_templates

    def initialize(resource_templates:, **kwargs)
      @resource_templates = resource_templates
      super(resource_templates: resource_templates, **kwargs)
    end
  end
end