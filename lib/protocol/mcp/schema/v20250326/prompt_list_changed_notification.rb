# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface PromptListChangedNotification extends Notification {
#   method: "notifications/prompts/list_changed";
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # An optional notification from the server to the client, informing it that the list of prompts it offers has changed. This may be issued by servers without any previous subscription from the client.
  class PromptListChangedNotification < Notification
    include Protocol::Mcp::Schema::Type
    include ServerNotification

    def initialize(**params)
      super(method: "notifications/prompts/list_changed", params:)
    end
  end
end