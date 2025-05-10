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

    attr_reader :type

    # The base64-encoded image data.
    attr_reader :data

    # The MIME type of the image. Different providers may support different image types.
    attr_reader :mime_type

    # @param data [String] The base64-encoded image data.
    #   @format byte
    # @param mime_type [String]
    #   The MIME type of the image. Different providers may support different image types.
    def initialize(data:, mime_type:, **kwargs)
      @type = "image"
      @data = data
      @mime_type = mime_type
      super(**kwargs)
    end
  end
end