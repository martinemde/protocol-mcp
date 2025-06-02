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
    include Protocol::Mcp::Schema::Type

    schema_attribute :type

    # The text content of the message.
    schema_attribute :text

    # @param text [String] The text content of the message.
    def initialize(text:, **kwargs)
      type = "text"
      super(type: type, text: text, **kwargs)
    end
  end
end