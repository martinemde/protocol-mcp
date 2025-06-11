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
    include Protocol::Mcp::Schema::Type

    # The name of the argument.
    schema_attribute :name

    # A human-readable description of the argument.
    schema_attribute :description, optional: true

    # Whether this argument must be provided.
    schema_attribute :required, optional: true

    attr_reader :attributes

    # @param name [String] The name of the argument.
    # @param description [String] (nil) A human-readable description of the argument.
    # @param required [Boolean] (nil) Whether this argument must be provided.
    def initialize(name:, description: nil, required: nil, **kwargs)
      @attributes = { name: name, description: description, required: required }.merge(kwargs)
    end
  end
end