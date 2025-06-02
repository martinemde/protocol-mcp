# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface SetLevelRequest extends Request {
#   method: "logging/setLevel";
#   params: {
#     /**
#      * The level of logging that the client wants to receive from the server. The server should send all logs at this level and higher (i.e., more severe) to the client as notifications/message.
#      */
#     level: LoggingLevel;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # A request from the client to the server, to enable or adjust logging.
  class SetLevelRequest < Request
    include Protocol::Mcp::Schema::Type
    include ClientRequest

    # The level of logging that the client wants to receive from the server. The server should send all logs at this level and higher (i.e., more severe) to the client as notifications/message.
    schema_attribute :level

    # @param level [LoggingLevel]
    #   The level of logging that the client wants to receive from the server. The server should send all logs at this level and higher (i.e., more severe) to the client as notifications/message.
    def initialize(level:)
      params = {
        level: level,
      }
      super(method: "logging/setLevel", params:)
    end
  end
end