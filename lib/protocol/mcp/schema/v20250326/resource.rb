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

    # The URI of this resource.
    attr_reader :uri

    # A human-readable name for this resource.
    # 
    # This can be used by clients to populate UI elements.
    attr_reader :name

    # A description of what this resource represents.
    # 
    # This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
    attr_reader :description

    # The MIME type of this resource, if known.
    attr_reader :mime_type

    # Optional annotations for the client.
    attr_reader :annotations

    # @param uri [String] The URI of this resource.
    #   @format uri
    # @param name [String] A human-readable name for this resource.
    #   This can be used by clients to populate UI elements.
    # @param description [String] (nil) A description of what this resource represents.
    #   This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
    # @param mime_type [String] (nil) The MIME type of this resource, if known.
    # @param annotations [Annotations] (nil) Optional annotations for the client.
    def initialize(uri:, name:, description: nil, mime_type: nil, annotations: nil)
      @uri = uri
      @name = name
      @description = description
      @mime_type = mime_type
      @annotations = annotations
    end
  end
end