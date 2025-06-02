# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ResourceListChangedNotification extends Notification {
#   method: "notifications/resources/list_changed";
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # An optional notification from the server to the client, informing it that the list of resources it can read from has changed. This may be issued by servers without any previous subscription from the client.
  class ResourceListChangedNotification < Notification
    include Protocol::Mcp::Schema::Type
    include ServerNotification

    def initialize(**params)
      super(method: "notifications/resources/list_changed", params:)
    end
  end
end