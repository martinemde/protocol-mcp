# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface RootsListChangedNotification extends Notification {
#   method: "notifications/roots/list_changed";
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # A notification from the client to the server, informing it that the list of roots has changed.
  # This notification should be sent whenever the client adds, removes, or modifies any root.
  # The server should then request an updated list of roots using the ListRootsRequest.
  class RootsListChangedNotification < Notification
    include Protocol::Mcp::Schema::Type
    include ClientNotification

    def initialize(**params)
      super(method: "notifications/roots/list_changed", params:)
    end
  end
end