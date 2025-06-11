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
module Protocol::Mcp::Schema::V20250326
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

    METHOD = "notifications/cancelled"

    # The ID of the request to cancel.
    # 
    # This MUST correspond to the ID of a request previously issued in the same direction.
    params_attribute :request_id

    # An optional string describing the reason for the cancellation. This MAY be logged or presented to the user.
    params_attribute :reason, optional: true

    # @param request_id [RequestId] The ID of the request to cancel.
    #   This MUST correspond to the ID of a request previously issued in the same direction.
    # @param reason [String] (nil)
    #   An optional string describing the reason for the cancellation. This MAY be logged or presented to the user.
    def initialize(request_id:, reason: nil)
      params = {
        requestId: request_id,
        reason: reason,
      }
      super(method: METHOD, params:)
    end
  end
end