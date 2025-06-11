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
    include Protocol::Mcp::Schema::Type

    schema_attribute :type

    # The text content of the message.
    schema_attribute :text

    # Optional annotations for the client.
    schema_attribute :annotations, optional: true

    attr_reader :attributes

    # @param text [String] The text content of the message.
    # @param annotations [Annotations] (nil) Optional annotations for the client.
    def initialize(text:, annotations: nil, **kwargs)
      type = "text"
      @attributes = { type: type, text: text, annotations: annotations }.merge(kwargs)
    end
  end
end