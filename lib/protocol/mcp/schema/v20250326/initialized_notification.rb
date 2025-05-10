# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface InitializedNotification extends Notification {
#   method: "notifications/initialized";
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # This notification is sent from the client to the server after initialization has finished.
  class InitializedNotification < Notification
    include ClientNotification

    def initialize(**params)
      super(method: "notifications/initialized", params:)
    end
  end
end