# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ProgressNotification extends Notification {
#   method: "notifications/progress";
#   params: {
#     /**
#      * The progress token which was given in the initial request, used to associate this notification with the request that is proceeding.
#      */
#     progressToken: ProgressToken;
#     /**
#      * The progress thus far. This should increase every time progress is made, even if the total is unknown.
#      *
#      * @TJS-type number
#      */
#     progress: number;
#     /**
#      * Total number of items to process (or total progress required), if known.
#      *
#      * @TJS-type number
#      */
#     total?: number;
#     /**
#      * An optional message describing the current progress.
#      */
#     message?: string;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # An out-of-band notification used to inform the receiver of a progress update for a long-running request.
  class ProgressNotification < Notification
    include Protocol::Mcp::Schema::Type
    include ClientNotification
    include ServerNotification

    METHOD = "notifications/progress"

    # The progress token which was given in the initial request, used to associate this notification with the request that is proceeding.
    params_attribute :progress_token

    # The progress thus far. This should increase every time progress is made, even if the total is unknown.
    params_attribute :progress

    # Total number of items to process (or total progress required), if known.
    params_attribute :total, optional: true

    # An optional message describing the current progress.
    params_attribute :message, optional: true

    # @param progress_token [ProgressToken]
    #   The progress token which was given in the initial request, used to associate this notification with the request that is proceeding.
    # @param progress [Numeric]
    #   The progress thus far. This should increase every time progress is made, even if the total is unknown.
    # @param total [Numeric] (nil)
    #   Total number of items to process (or total progress required), if known.
    # @param message [String] (nil)
    #   An optional message describing the current progress.
    def initialize(progress_token:, progress:, total: nil, message: nil)
      params = {
        progressToken: progress_token,
        progress: progress,
        total: total,
        message: message,
      }
      super(method: METHOD, params:)
    end
  end
end