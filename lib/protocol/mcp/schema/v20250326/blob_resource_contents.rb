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
module Protocol::Mcp::Schema::V20250326
  class BlobResourceContents < ResourceContents
    include Protocol::Mcp::Schema::Type

    # A base64-encoded string representing the binary data of the item.
    schema_attribute :blob

    # @param blob [String]
    #   A base64-encoded string representing the binary data of the item.
    #   @format byte
    def initialize(blob:, **kwargs)
      super(blob: blob, **kwargs)
    end
  end
end