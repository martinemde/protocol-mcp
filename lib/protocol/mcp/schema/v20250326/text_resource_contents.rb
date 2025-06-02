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
    include Protocol::Mcp::Schema::Type

    # The text of the item. This must only be set if the item can actually be represented as text (not binary data).
    schema_attribute :text

    # @param text [String]
    #   The text of the item. This must only be set if the item can actually be represented as text (not binary data).
    def initialize(text:, **kwargs)
      super(text: text, **kwargs)
    end
  end
end