# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface GetPromptRequest extends Request {
#   method: "prompts/get";
#   params: {
#     /**
#      * The name of the prompt or prompt template.
#      */
#     name: string;
#     /**
#      * Arguments to use for templating the prompt.
#      */
#     arguments?: { [key: string]: string };
#   };
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Used by the client to get a prompt provided by the server.
  class GetPromptRequest < Request
    include ClientRequest

    # The name of the prompt or prompt template.
    attr_reader :name

    # Arguments to use for templating the prompt.
    attr_reader :arguments

    # @param name [String] The name of the prompt or prompt template.
    # @param arguments [Hash] (nil) Arguments to use for templating the prompt.
    def initialize(name:, arguments: nil)
      @name = name
      @arguments = arguments
      params = {
        name: name,
        arguments: arguments,
      }
      super(method: "prompts/get", params:)
    end
  end
end