# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface UnsubscribeRequest extends Request {
#   method: "resources/unsubscribe";
#   params: {
#     /**
#      * The URI of the resource to unsubscribe from.
#      *
#      * @format uri
#      */
#     uri: string;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Sent from the client to request cancellation of resources/updated notifications from the server. This should follow a previous resources/subscribe request.
  class UnsubscribeRequest < Request
    include ClientRequest

    # The URI of the resource to unsubscribe from.
    attr_reader :uri

    # @param uri [String] The URI of the resource to unsubscribe from.
    #   @format uri
    def initialize(uri:)
      @uri = uri
      params = {
        uri: uri,
      }
      super(method: "resources/unsubscribe", params:)
    end
  end
end