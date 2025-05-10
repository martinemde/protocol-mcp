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
module Protocol::Mcp::Schema::V20241105
  # A reference to a resource or resource template definition.
  class ResourceReference

    attr_reader :type

    # The URI or URI template of the resource.
    attr_reader :uri

    # @param uri [String] The URI or URI template of the resource.
    #   @format uri-template
    def initialize(uri:)
      @type = "ref/resource"
      @uri = uri
    end
  end
end