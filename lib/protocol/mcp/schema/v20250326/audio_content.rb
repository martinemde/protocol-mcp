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
    include Protocol::Mcp::Schema::Type

    schema_attribute :type

    # The base64-encoded audio data.
    schema_attribute :data

    # The MIME type of the audio. Different providers may support different audio types.
    schema_attribute :mime_type

    # Optional annotations for the client.
    schema_attribute :annotations, optional: true

    attr_reader :attributes

    # @param data [String] The base64-encoded audio data.
    #   @format byte
    # @param mime_type [String]
    #   The MIME type of the audio. Different providers may support different audio types.
    # @param annotations [Annotations] (nil) Optional annotations for the client.
    def initialize(data:, mime_type:, annotations: nil, **kwargs)
      type = "audio"
      @attributes = { type: type, data: data, mimeType: mime_type, annotations: annotations }.merge(kwargs)
    end
  end
end