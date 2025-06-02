# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface PromptReference {
#   type: "ref/prompt";
#   /**
#    * The name of the prompt or prompt template
#    */
#   name: string;
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Identifies a prompt.
  class PromptReference
    include Protocol::Mcp::Schema::Type

    schema_attribute :type

    # The name of the prompt or prompt template
    schema_attribute :name

    attr_reader :attributes

    # @param name [String] The name of the prompt or prompt template
    def initialize(name:, **kwargs)
      type = "ref/prompt"
      @attributes = { type: type, name: name }.merge(kwargs)
    end
  end
end