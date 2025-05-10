# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface TextContent extends Annotated {
#   type: "text";
#   /**
#    * The text content of the message.
#    */
#   text: string;
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Text provided to or from an LLM.
  class TextContent < Annotated

    attr_reader :type

    # The text content of the message.
    attr_reader :text

    # @param text [String] The text content of the message.
    def initialize(text:, **kwargs)
      @type = "text"
      @text = text
      super(**kwargs)
    end
  end
end