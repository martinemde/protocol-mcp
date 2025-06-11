# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ResourceUpdatedNotification extends Notification {
#   method: "notifications/resources/updated";
#   params: {
#     /**
#      * The URI of the resource that has been updated. This might be a sub-resource of the one that the client actually subscribed to.
#      *
#      * @format uri
#      */
#     uri: string;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # A notification from the server to the client, informing it that a resource has changed and may need to be read again. This should only be sent if the client previously sent a resources/subscribe request.
  class ResourceUpdatedNotification < Notification
    include Protocol::Mcp::Schema::Type
    include ServerNotification

    METHOD = "notifications/resources/updated"

    # The URI of the resource that has been updated. This might be a sub-resource of the one that the client actually subscribed to.
    schema_attribute :uri

    # @param uri [String]
    #   The URI of the resource that has been updated. This might be a sub-resource of the one that the client actually subscribed to.
    #   @format uri
    def initialize(uri:)
      params = {
        uri: uri,
      }
      super(method: "notifications/resources/updated", params:)
    end
  end
end