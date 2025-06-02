# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface GetPromptResult extends Result {
#   /**
#    * An optional description for the prompt.
#    */
#   description?: string;
#   messages: PromptMessage[];
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # The server's response to a prompts/get request from the client.
  class GetPromptResult < Result
    include ServerResult

    # An optional description for the prompt.
    attr_reader :description

    attr_reader :messages

    # @param description [String] (nil) An optional description for the prompt.
    def initialize(description: nil, messages:, **kwargs)
      @description = description
      @messages = messages
      super(description: description, messages: messages, **kwargs)
    end
  end
end