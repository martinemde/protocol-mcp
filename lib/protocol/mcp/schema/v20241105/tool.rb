# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface Tool {
#   /**
#    * The name of the tool.
#    */
#   name: string;
#   /**
#    * A human-readable description of the tool.
#    */
#   description?: string;
#   /**
#    * A JSON Schema object defining the expected parameters for the tool.
#    */
#   inputSchema: {
#     type: "object";
#     properties?: { [key: string]: object };
#     required?: string[];
#   };
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Definition for a tool the client can call.
  class Tool
    include Protocol::Mcp::Schema::Type

    # The name of the tool.
    schema_attribute :name

    # A human-readable description of the tool.
    schema_attribute :description, optional: true

    # A JSON Schema object defining the expected parameters for the tool.
    schema_attribute :input_schema

    attr_reader :attributes

    # @param name [String] The name of the tool.
    # @param description [String] (nil) A human-readable description of the tool.
    # @param input_schema [Hash]
    #   A JSON Schema object defining the expected parameters for the tool.
    def initialize(name:, description: nil, input_schema:, **kwargs)
      @attributes = { name: name, description: description, inputSchema: input_schema }.merge(kwargs)
    end
  end
end