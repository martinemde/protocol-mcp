# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ImageContent extends Annotated {
#   type: "image";
#   /**
#    * The base64-encoded image data.
#    *
#    * @format byte
#    */
#   data: string;
#   /**
#    * The MIME type of the image. Different providers may support different image types.
#    */
#   mimeType: string;
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # An image provided to or from an LLM.
  class ImageContent < Annotated

    schema_attribute :type

    # The base64-encoded image data.
    schema_attribute :data

    # The MIME type of the image. Different providers may support different image types.
    schema_attribute :mime_type

    # @param data [String] The base64-encoded image data.
    #   @format byte
    # @param mime_type [String]
    #   The MIME type of the image. Different providers may support different image types.
    def initialize(data:, mime_type:, **kwargs)
      super(type: type, data: data, mime_type: mime_type, **kwargs)
    end
  end
end