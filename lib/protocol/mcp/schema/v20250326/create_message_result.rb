# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface CreateMessageResult extends Result, SamplingMessage {
#   /**
#    * The name of the model that generated the message.
#    */
#   model: string;
#   /**
#    * The reason why sampling stopped, if known.
#    */
#   stopReason?: "endTurn" | "stopSequence" | "maxTokens" | string;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # The client's response to a sampling/create_message request from the server. The client should inform the user before returning the sampled message, to allow them to inspect the response (human in the loop) and decide whether to allow the server to see it.
  class CreateMessageResult < Result
    include Protocol::Mcp::Schema::Type
    include ClientResult

    # The name of the model that generated the message.
    schema_attribute :model

    # The reason why sampling stopped, if known.
    schema_attribute :stop_reason

    # @param model [String] The name of the model that generated the message.
    # @param stop_reason [endTurn, stopSequence, maxTokens, String] (nil) The reason why sampling stopped, if known.
    def initialize(model:, stop_reason: nil, **kwargs)
      super(model: model, stop_reason: stop_reason, **kwargs)
    end
  end
end