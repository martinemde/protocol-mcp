# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface Resource {
#   /**
#    * The URI of this resource.
#    *
#    * @format uri
#    */
#   uri: string;
# 
#   /**
#    * A human-readable name for this resource.
#    *
#    * This can be used by clients to populate UI elements.
#    */
#   name: string;
# 
#   /**
#    * A description of what this resource represents.
#    *
#    * This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
#    */
#   description?: string;
# 
#   /**
#    * The MIME type of this resource, if known.
#    */
#   mimeType?: string;
# 
#   /**
#    * Optional annotations for the client.
#    */
#   annotations?: Annotations;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # A known resource that the server is capable of reading.
  class Resource
    include Protocol::Mcp::Schema::Type

    # The URI of this resource.
    schema_attribute :uri

    # A human-readable name for this resource.
    # 
    # This can be used by clients to populate UI elements.
    schema_attribute :name

    # A description of what this resource represents.
    # 
    # This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
    schema_attribute :description

    # The MIME type of this resource, if known.
    schema_attribute :mime_type

    # Optional annotations for the client.
    schema_attribute :annotations

    attr_reader :attributes

    # @param uri [String] The URI of this resource.
    #   @format uri
    # @param name [String] A human-readable name for this resource.
    #   This can be used by clients to populate UI elements.
    # @param description [String] (nil) A description of what this resource represents.
    #   This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
    # @param mime_type [String] (nil) The MIME type of this resource, if known.
    # @param annotations [Annotations] (nil) Optional annotations for the client.
    def initialize(uri:, name:, description: nil, mime_type: nil, annotations: nil, **kwargs)
      @attributes = { uri: uri, name: name, description: description, mimeType: mime_type, annotations: annotations }.merge(kwargs)
    end
  end
end