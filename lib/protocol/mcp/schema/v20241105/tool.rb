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

    # The name of the tool.
    attr_reader :name

    # A human-readable description of the tool.
    attr_reader :description

    # A JSON Schema object defining the expected parameters for the tool.
    attr_reader :input_schema

    # @param name [String] The name of the tool.
    # @param description [String] (nil) A human-readable description of the tool.
    # @param input_schema [Hash]
    #   A JSON Schema object defining the expected parameters for the tool.
    def initialize(name:, description: nil, input_schema:)
      @name = name
      @description = description
      @input_schema = input_schema
    end
  end
end