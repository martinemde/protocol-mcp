# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface InitializedNotification extends Notification {
#   method: "notifications/initialized";
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # This notification is sent from the client to the server after initialization has finished.
  class InitializedNotification < Notification
    include Protocol::Mcp::Schema::Type
    include ClientNotification

    METHOD = "notifications/initialized"

    def initialize(**params)
      super(method: METHOD, params:)
    end
  end
end