# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface EmbeddedResource extends Annotated {
#   type: "resource";
#   resource: TextResourceContents | BlobResourceContents;
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # The contents of a resource, embedded into a prompt or tool call result.
  # 
  # It is up to the client how best to render embedded resources for the benefit
  # of the LLM and/or the user.
  class EmbeddedResource < Annotated

    attr_reader :type

    attr_reader :resource

    def initialize(resource:, **kwargs)
      @type = "resource"
      @resource = resource
      super(**kwargs)
    end
  end
end