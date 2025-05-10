# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface PromptArgument {
#   /**
#    * The name of the argument.
#    */
#   name: string;
#   /**
#    * A human-readable description of the argument.
#    */
#   description?: string;
#   /**
#    * Whether this argument must be provided.
#    */
#   required?: boolean;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Describes an argument that a prompt can accept.
  class PromptArgument

    # The name of the argument.
    attr_reader :name

    # A human-readable description of the argument.
    attr_reader :description

    # Whether this argument must be provided.
    attr_reader :required

    # @param name [String] The name of the argument.
    # @param description [String] (nil) A human-readable description of the argument.
    # @param required [Boolean] (nil) Whether this argument must be provided.
    def initialize(name:, description: nil, required: nil)
      @name = name
      @description = description
      @required = required
    end
  end
end