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

    attr_reader :type

    # The base64-encoded image data.
    attr_reader :data

    # The MIME type of the image. Different providers may support different image types.
    attr_reader :mime_type

    # Optional annotations for the client.
    attr_reader :annotations

    # @param data [String] The base64-encoded image data.
    #   @format byte
    # @param mime_type [String]
    #   The MIME type of the image. Different providers may support different image types.
    # @param annotations [Annotations] (nil) Optional annotations for the client.
    def initialize(data:, mime_type:, annotations: nil)
      @type = "image"
      @data = data
      @mime_type = mime_type
      @annotations = annotations
    end
  end
end