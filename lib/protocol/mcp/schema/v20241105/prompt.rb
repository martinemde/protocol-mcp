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
module Protocol::Mcp::Schema::V20241105
  # A prompt or prompt template that the server offers.
  class Prompt
    include Protocol::Mcp::Schema::Type

    # The name of the prompt or prompt template.
    schema_attribute :name

    # An optional description of what this prompt provides
    schema_attribute :description, optional: true

    # A list of arguments to use for templating the prompt.
    schema_attribute :arguments, optional: true

    attr_reader :attributes

    # @param name [String] The name of the prompt or prompt template.
    # @param description [String] (nil)
    #   An optional description of what this prompt provides
    # @param arguments [Array<PromptArgument>] (nil)
    #   A list of arguments to use for templating the prompt.
    def initialize(name:, description: nil, arguments: nil, **kwargs)
      @attributes = { name: name, description: description, arguments: arguments }.merge(kwargs)
    end
  end
end