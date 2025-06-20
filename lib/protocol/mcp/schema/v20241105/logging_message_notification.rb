# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface LoggingMessageNotification extends Notification {
#   method: "notifications/message";
#   params: {
#     /**
#      * The severity of this log message.
#      */
#     level: LoggingLevel;
#     /**
#      * An optional name of the logger issuing this message.
#      */
#     logger?: string;
#     /**
#      * The data to be logged, such as a string message or an object. Any JSON serializable type is allowed here.
#      */
#     data: unknown;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Notification of a log message passed from server to client. If no logging/setLevel request has been sent from the client, the server MAY decide which messages to send automatically.
  class LoggingMessageNotification < Notification
    include Protocol::Mcp::Schema::Type
    include ServerNotification

    METHOD = "notifications/message"

    # The severity of this log message.
    params_attribute :level

    # An optional name of the logger issuing this message.
    params_attribute :logger, optional: true

    # The data to be logged, such as a string message or an object. Any JSON serializable type is allowed here.
    params_attribute :data

    # @param level [LoggingLevel] The severity of this log message.
    # @param logger [String] (nil)
    #   An optional name of the logger issuing this message.
    # @param data [Object]
    #   The data to be logged, such as a string message or an object. Any JSON serializable type is allowed here.
    def initialize(level:, logger: nil, data:)
      params = {
        level: level,
        logger: logger,
        data: data,
      }
      super(method: METHOD, params:)
    end
  end
end