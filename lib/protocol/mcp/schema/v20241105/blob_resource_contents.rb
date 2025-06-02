# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface BlobResourceContents extends ResourceContents {
#   /**
#    * A base64-encoded string representing the binary data of the item.
#    *
#    * @format byte
#    */
#   blob: string;
# }
# ```
module Protocol::Mcp::Schema::V20241105
  class BlobResourceContents < ResourceContents

    # A base64-encoded string representing the binary data of the item.
    attr_reader :blob

    # @param blob [String]
    #   A base64-encoded string representing the binary data of the item.
    #   @format byte
    def initialize(blob:, **kwargs)
      @blob = blob
      super(blob: blob, **kwargs)
    end
  end
end