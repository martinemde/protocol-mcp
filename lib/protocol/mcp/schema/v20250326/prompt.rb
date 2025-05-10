# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface Prompt {
#   /**
#    * The name of the prompt or prompt template.
#    */
#   name: string;
#   /**
#    * An optional description of what this prompt provides
#    */
#   description?: string;
#   /**
#    * A list of arguments to use for templating the prompt.
#    */
#   arguments?: PromptArgument[];
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # A prompt or prompt template that the server offers.
  class Prompt

    # The name of the prompt or prompt template.
    attr_reader :name

    # An optional description of what this prompt provides
    attr_reader :description

    # A list of arguments to use for templating the prompt.
    attr_reader :arguments

    # @param name [String] The name of the prompt or prompt template.
    # @param description [String] (nil)
    #   An optional description of what this prompt provides
    # @param arguments [Array<PromptArgument>] (nil)
    #   A list of arguments to use for templating the prompt.
    def initialize(name:, description: nil, arguments: nil)
      @name = name
      @description = description
      @arguments = arguments
    end
  end
end