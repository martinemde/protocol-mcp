# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface Resource extends Annotated {
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
#    * The size of the raw resource content, in bytes (i.e., before base64 encoding or any tokenization), if known.
#    *
#    * This can be used by Hosts to display file sizes and estimate context window usage.
#    */
#   size?: number;
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # A known resource that the server is capable of reading.
  class Resource < Annotated

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

    # The size of the raw resource content, in bytes (i.e., before base64 encoding or any tokenization), if known.
    # 
    # This can be used by Hosts to display file sizes and estimate context window usage.
    attr_reader :size

    # @param uri [String] The URI of this resource.
    #   @format uri
    # @param name [String] A human-readable name for this resource.
    #   This can be used by clients to populate UI elements.
    # @param description [String] (nil) A description of what this resource represents.
    #   This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
    # @param mime_type [String] (nil) The MIME type of this resource, if known.
    # @param size [Numeric] (nil)
    #   The size of the raw resource content, in bytes (i.e., before base64 encoding or any tokenization), if known.
    #   This can be used by Hosts to display file sizes and estimate context window usage.
    def initialize(uri:, name:, description: nil, mime_type: nil, size: nil, **kwargs)
      @uri = uri
      @name = name
      @description = description
      @mime_type = mime_type
      @size = size
      super(uri: uri, name: name, description: description, mime_type: mime_type, size: size, **kwargs)
    end
  end
end