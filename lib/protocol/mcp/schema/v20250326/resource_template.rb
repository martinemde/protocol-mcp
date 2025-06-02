# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ResourceTemplate {
#   /**
#    * A URI template (according to RFC 6570) that can be used to construct resource URIs.
#    *
#    * @format uri-template
#    */
#   uriTemplate: string;
# 
#   /**
#    * A human-readable name for the type of resource this template refers to.
#    *
#    * This can be used by clients to populate UI elements.
#    */
#   name: string;
# 
#   /**
#    * A description of what this template is for.
#    *
#    * This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
#    */
#   description?: string;
# 
#   /**
#    * The MIME type for all resources that match this template. This should only be included if all resources matching this template have the same type.
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
  # A template description for resources available on the server.
  class ResourceTemplate
    include Protocol::Mcp::Schema::Type

    # A URI template (according to RFC 6570) that can be used to construct resource URIs.
    schema_attribute :uri_template

    # A human-readable name for the type of resource this template refers to.
    # 
    # This can be used by clients to populate UI elements.
    schema_attribute :name

    # A description of what this template is for.
    # 
    # This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
    schema_attribute :description

    # The MIME type for all resources that match this template. This should only be included if all resources matching this template have the same type.
    schema_attribute :mime_type

    # Optional annotations for the client.
    schema_attribute :annotations

    attr_reader :attributes

    # @param uri_template [String]
    #   A URI template (according to RFC 6570) that can be used to construct resource URIs.
    #   @format uri-template
    # @param name [String]
    #   A human-readable name for the type of resource this template refers to.
    #   This can be used by clients to populate UI elements.
    # @param description [String] (nil) A description of what this template is for.
    #   This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
    # @param mime_type [String] (nil)
    #   The MIME type for all resources that match this template. This should only be included if all resources matching this template have the same type.
    # @param annotations [Annotations] (nil) Optional annotations for the client.
    def initialize(uri_template:, name:, description: nil, mime_type: nil, annotations: nil, **kwargs)
      @attributes = { uriTemplate: uri_template, name: name, description: description, mimeType: mime_type, annotations: annotations }.merge(kwargs)
    end
  end
end