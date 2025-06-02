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
module Protocol::Mcp::Schema::V20250326
  # Used by the client to get a prompt provided by the server.
  class GetPromptRequest < Request
    include Protocol::Mcp::Schema::Type
    include ClientRequest

    # The name of the prompt or prompt template.
    schema_attribute :name

    # Arguments to use for templating the prompt.
    schema_attribute :arguments

    # @param name [String] The name of the prompt or prompt template.
    # @param arguments [Hash] (nil) Arguments to use for templating the prompt.
    def initialize(name:, arguments: nil)
      params = {
        name: name,
        arguments: arguments,
      }
      super(method: "prompts/get", params:)
    end
  end
end