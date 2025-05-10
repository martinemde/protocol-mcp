# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ServerCapabilities {
#   /**
#    * Experimental, non-standard capabilities that the server supports.
#    */
#   experimental?: { [key: string]: object };
#   /**
#    * Present if the server supports sending log messages to the client.
#    */
#   logging?: object;
#   /**
#    * Present if the server supports argument autocompletion suggestions.
#    */
#   completions?: object;
#   /**
#    * Present if the server offers any prompt templates.
#    */
#   prompts?: {
#     /**
#      * Whether this server supports notifications for changes to the prompt list.
#      */
#     listChanged?: boolean;
#   };
#   /**
#    * Present if the server offers any resources to read.
#    */
#   resources?: {
#     /**
#      * Whether this server supports subscribing to resource updates.
#      */
#     subscribe?: boolean;
#     /**
#      * Whether this server supports notifications for changes to the resource list.
#      */
#     listChanged?: boolean;
#   };
#   /**
#    * Present if the server offers any tools to call.
#    */
#   tools?: {
#     /**
#      * Whether this server supports notifications for changes to the tool list.
#      */
#     listChanged?: boolean;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Capabilities that a server may support. Known capabilities are defined here, in this schema, but this is not a closed set: any server can define its own, additional capabilities.
  class ServerCapabilities

    # Experimental, non-standard capabilities that the server supports.
    attr_reader :experimental

    # Present if the server supports sending log messages to the client.
    attr_reader :logging

    # Present if the server supports argument autocompletion suggestions.
    attr_reader :completions

    # Present if the server offers any prompt templates.
    attr_reader :prompts

    # Present if the server offers any resources to read.
    attr_reader :resources

    # Present if the server offers any tools to call.
    attr_reader :tools

    # @param experimental [Hash] (nil)
    #   Experimental, non-standard capabilities that the server supports.
    # @param logging [object] (nil)
    #   Present if the server supports sending log messages to the client.
    # @param completions [object] (nil)
    #   Present if the server supports argument autocompletion suggestions.
    # @param prompts [Hash] (nil)
    #   Present if the server offers any prompt templates.
    # @param resources [Hash] (nil)
    #   Present if the server offers any resources to read.
    # @param tools [Hash] (nil) Present if the server offers any tools to call.
    def initialize(experimental: nil, logging: nil, completions: nil, prompts: nil, resources: nil, tools: nil)
      @experimental = experimental
      @logging = logging
      @completions = completions
      @prompts = prompts
      @resources = resources
      @tools = tools
    end
  end
end