# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ResourceReference {
#   type: "ref/resource";
#   /**
#    * The URI or URI template of the resource.
#    *
#    * @format uri-template
#    */
#   uri: string;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # A reference to a resource or resource template definition.
  class ResourceReference
    include Protocol::Mcp::Schema::Type

    schema_attribute :type

    # The URI or URI template of the resource.
    schema_attribute :uri

    attr_reader :attributes

    # @param uri [String] The URI or URI template of the resource.
    #   @format uri-template
    def initialize(uri:, **kwargs)
      @attributes = { type: type, uri: uri }.merge(kwargs)
    end
  end
end