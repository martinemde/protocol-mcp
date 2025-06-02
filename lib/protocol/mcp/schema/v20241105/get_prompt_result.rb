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
module Protocol::Mcp::Schema::V20241105
  # The server's response to a prompts/get request from the client.
  class GetPromptResult < Result
    include ServerResult

    # An optional description for the prompt.
    schema_attribute :description

    schema_attribute :messages

    # @param description [String] (nil) An optional description for the prompt.
    def initialize(description: nil, messages:, **kwargs)
      super(description: description, messages: messages, **kwargs)
    end
  end
end