# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface TextResourceContents extends ResourceContents {
#   /**
#    * The text of the item. This must only be set if the item can actually be represented as text (not binary data).
#    */
#   text: string;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  class TextResourceContents < ResourceContents

    # The text of the item. This must only be set if the item can actually be represented as text (not binary data).
    attr_reader :text

    # @param text [String]
    #   The text of the item. This must only be set if the item can actually be represented as text (not binary data).
    def initialize(text:, **kwargs)
      @text = text
      super(text: text, **kwargs)
    end
  end
end