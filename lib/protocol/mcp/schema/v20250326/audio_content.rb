# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface AudioContent {
#   type: "audio";
# 
#   /**
#    * The base64-encoded audio data.
#    *
#    * @format byte
#    */
#   data: string;
# 
#   /**
#    * The MIME type of the audio. Different providers may support different audio types.
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
  # Audio provided to or from an LLM.
  class AudioContent

    attr_reader :type

    # The base64-encoded audio data.
    attr_reader :data

    # The MIME type of the audio. Different providers may support different audio types.
    attr_reader :mime_type

    # Optional annotations for the client.
    attr_reader :annotations

    # @param data [String] The base64-encoded audio data.
    #   @format byte
    # @param mime_type [String]
    #   The MIME type of the audio. Different providers may support different audio types.
    # @param annotations [Annotations] (nil) Optional annotations for the client.
    def initialize(data:, mime_type:, annotations: nil)
      @type = "audio"
      @data = data
      @mime_type = mime_type
      @annotations = annotations
    end
  end
end