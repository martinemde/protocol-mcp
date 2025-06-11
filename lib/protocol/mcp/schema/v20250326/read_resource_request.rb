# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ReadResourceRequest extends Request {
#   method: "resources/read";
#   params: {
#     /**
#      * The URI of the resource to read. The URI can use any protocol; it is up to the server how to interpret it.
#      *
#      * @format uri
#      */
#     uri: string;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Sent from the client to the server, to read a specific resource URI.
  class ReadResourceRequest < Request
    include Protocol::Mcp::Schema::Type
    include ClientRequest

    METHOD = "resources/read"

    # The URI of the resource to read. The URI can use any protocol; it is up to the server how to interpret it.
    params_attribute :uri

    # @param uri [String]
    #   The URI of the resource to read. The URI can use any protocol; it is up to the server how to interpret it.
    #   @format uri
    def initialize(uri:)
      params = {
        uri: uri,
      }
      super(method: METHOD, params:)
    end
  end
end