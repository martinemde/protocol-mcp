# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ImageContent {
#   type: "image";
# 
#   /**
#    * The base64-encoded image data.
#    *
#    * @format byte
#    */
#   data: string;
# 
#   /**
#    * The MIME type of the image. Different providers may support different image types.
#    */
#   mimeType: string;
# 
#   /**
#    * Optional annotations for the client.
#    */
#   annotations?: Annotations;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # An image provided to or from an LLM.
  class ImageContent
    include Protocol::Mcp::Schema::Type

    schema_attribute :type

    # The base64-encoded image data.
    schema_attribute :data

    # The MIME type of the image. Different providers may support different image types.
    schema_attribute :mime_type

    # Optional annotations for the client.
    schema_attribute :annotations

    attr_reader :attributes

    # @param data [String] The base64-encoded image data.
    #   @format byte
    # @param mime_type [String]
    #   The MIME type of the image. Different providers may support different image types.
    # @param annotations [Annotations] (nil) Optional annotations for the client.
    def initialize(data:, mime_type:, annotations: nil, **kwargs)
      type = "image"
      @attributes = { type: type, data: data, mimeType: mime_type, annotations: annotations }.merge(kwargs)
    end
  end
end