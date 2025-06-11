# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface EmbeddedResource {
#   type: "resource";
#   resource: TextResourceContents | BlobResourceContents;
# 
#   /**
#    * Optional annotations for the client.
#    */
#   annotations?: Annotations;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # The contents of a resource, embedded into a prompt or tool call result.
  # 
  # It is up to the client how best to render embedded resources for the benefit
  # of the LLM and/or the user.
  class EmbeddedResource
    include Protocol::Mcp::Schema::Type

    schema_attribute :type

    schema_attribute :resource

    # Optional annotations for the client.
    schema_attribute :annotations, optional: true

    attr_reader :attributes

    # @param annotations [Annotations] (nil) Optional annotations for the client.
    def initialize(resource:, annotations: nil, **kwargs)
      type = "resource"
      @attributes = { type: type, resource: resource, annotations: annotations }.merge(kwargs)
    end
  end
end