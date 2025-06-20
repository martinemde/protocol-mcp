# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ToolListChangedNotification extends Notification {
#   method: "notifications/tools/list_changed";
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # An optional notification from the server to the client, informing it that the list of tools it offers has changed. This may be issued by servers without any previous subscription from the client.
  class ToolListChangedNotification < Notification
    include Protocol::Mcp::Schema::Type
    include ServerNotification

    METHOD = "notifications/tools/list_changed"

    def initialize(**params)
      super(method: METHOD, params:)
    end
  end
end