# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface TextContent {
#   type: "text";
# 
#   /**
#    * The text content of the message.
#    */
#   text: string;
# 
#   /**
#    * Optional annotations for the client.
#    */
#   annotations?: Annotations;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Text provided to or from an LLM.
  class TextContent

    attr_reader :type

    # The text content of the message.
    attr_reader :text

    # Optional annotations for the client.
    attr_reader :annotations

    # @param text [String] The text content of the message.
    # @param annotations [Annotations] (nil) Optional annotations for the client.
    def initialize(text:, annotations: nil)
      @type = "text"
      @text = text
      @annotations = annotations
    end
  end
end