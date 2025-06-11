# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface SubscribeRequest extends Request {
#   method: "resources/subscribe";
#   params: {
#     /**
#      * The URI of the resource to subscribe to. The URI can use any protocol; it is up to the server how to interpret it.
#      *
#      * @format uri
#      */
#     uri: string;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Sent from the client to request resources/updated notifications from the server whenever a particular resource changes.
  class SubscribeRequest < Request
    include Protocol::Mcp::Schema::Type
    include ClientRequest

    METHOD = "resources/subscribe"

    # The URI of the resource to subscribe to. The URI can use any protocol; it is up to the server how to interpret it.
    schema_attribute :uri

    # @param uri [String]
    #   The URI of the resource to subscribe to. The URI can use any protocol; it is up to the server how to interpret it.
    #   @format uri
    def initialize(uri:)
      params = {
        uri: uri,
      }
      super(method: "resources/subscribe", params:)
    end
  end
end