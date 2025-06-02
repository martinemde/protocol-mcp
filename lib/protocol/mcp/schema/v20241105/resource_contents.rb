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
    include Protocol::Mcp::Schema::Type

    # The URI of this resource.
    schema_attribute :uri

    # The MIME type of this resource, if known.
    schema_attribute :mime_type

    attr_reader :attributes

    # @param uri [String] The URI of this resource.
    #   @format uri
    # @param mime_type [String] (nil) The MIME type of this resource, if known.
    def initialize(uri:, mime_type: nil, **kwargs)
      @attributes = { uri: uri, mimeType: mime_type }.merge(kwargs)
    end
  end
end