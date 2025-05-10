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

    attr_reader :type

    # The name of the prompt or prompt template
    attr_reader :name

    # @param name [String] The name of the prompt or prompt template
    def initialize(name:)
      @type = "ref/prompt"
      @name = name
    end
  end
end