# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ResourceContents {
#   /**
#    * The URI of this resource.
#    *
#    * @format uri
#    */
#   uri: string;
#   /**
#    * The MIME type of this resource, if known.
#    */
#   mimeType?: string;
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # The contents of a specific resource or sub-resource.
  class ResourceContents

    # The URI of this resource.
    attr_reader :uri

    # The MIME type of this resource, if known.
    attr_reader :mime_type

    # @param uri [String] The URI of this resource.
    #   @format uri
    # @param mime_type [String] (nil) The MIME type of this resource, if known.
    def initialize(uri:, mime_type: nil)
      @uri = uri
      @mime_type = mime_type
    end
  end
end