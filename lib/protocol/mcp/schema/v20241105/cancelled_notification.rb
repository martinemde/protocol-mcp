# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface CancelledNotification extends Notification {
#   method: "notifications/cancelled";
#   params: {
#     /**
#      * The ID of the request to cancel.
#      *
#      * This MUST correspond to the ID of a request previously issued in the same direction.
#      */
#     requestId: RequestId;
# 
#     /**
#      * An optional string describing the reason for the cancellation. This MAY be logged or presented to the user.
#      */
#     reason?: string;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # This notification can be sent by either side to indicate that it is cancelling a previously-issued request.
  # 
  # The request SHOULD still be in-flight, but due to communication latency, it is always possible that this notification MAY arrive after the request has already finished.
  # 
  # This notification indicates that the result will be unused, so any associated processing SHOULD cease.
  # 
  # A client MUST NOT attempt to cancel its `initialize` request.
  class CancelledNotification < Notification
    include Protocol::Mcp::Schema::Type
    include ClientNotification
    include ServerNotification

    # The ID of the request to cancel.
    # 
    # This MUST correspond to the ID of a request previously issued in the same direction.
    schema_attribute :request_id

    # An optional string describing the reason for the cancellation. This MAY be logged or presented to the user.
    schema_attribute :reason

    # @param request_id [RequestId] The ID of the request to cancel.
    #   This MUST correspond to the ID of a request previously issued in the same direction.
    # @param reason [String] (nil)
    #   An optional string describing the reason for the cancellation. This MAY be logged or presented to the user.
    def initialize(request_id:, reason: nil)
      params = {
        requestId: request_id,
        reason: reason,
      }
      super(method: "notifications/cancelled", params:)
    end
  end
end