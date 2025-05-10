# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface Tool {
#   /**
#    * The name of the tool.
#    */
#   name: string;
# 
#   /**
#    * A human-readable description of the tool.
#    *
#    * This can be used by clients to improve the LLM's understanding of available tools. It can be thought of like a "hint" to the model.
#    */
#   description?: string;
# 
#   /**
#    * A JSON Schema object defining the expected parameters for the tool.
#    */
#   inputSchema: {
#     type: "object";
#     properties?: { [key: string]: object };
#     required?: string[];
#   };
# 
#   /**
#    * Optional additional tool information.
#    */
#   annotations?: ToolAnnotations;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Definition for a tool the client can call.
  class Tool

    # The name of the tool.
    attr_reader :name

    # A human-readable description of the tool.
    # 
    # This can be used by clients to improve the LLM's understanding of available tools. It can be thought of like a "hint" to the model.
    attr_reader :description

    # A JSON Schema object defining the expected parameters for the tool.
    attr_reader :input_schema

    # Optional additional tool information.
    attr_reader :annotations

    # @param name [String] The name of the tool.
    # @param description [String] (nil) A human-readable description of the tool.
    #   This can be used by clients to improve the LLM's understanding of available tools. It can be thought of like a "hint" to the model.
    # @param input_schema [Hash]
    #   A JSON Schema object defining the expected parameters for the tool.
    # @param annotations [ToolAnnotations] (nil) Optional additional tool information.
    def initialize(name:, description: nil, input_schema:, annotations: nil)
      @name = name
      @description = description
      @input_schema = input_schema
      @annotations = annotations
    end
  end
end