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
module Protocol::Mcp::Schema::V20241105
  # Capabilities that a server may support. Known capabilities are defined here, in this schema, but this is not a closed set: any server can define its own, additional capabilities.
  class ServerCapabilities
    include Protocol::Mcp::Schema::Type

    # Experimental, non-standard capabilities that the server supports.
    schema_attribute :experimental

    # Present if the server supports sending log messages to the client.
    schema_attribute :logging

    # Present if the server offers any prompt templates.
    schema_attribute :prompts

    # Present if the server offers any resources to read.
    schema_attribute :resources

    # Present if the server offers any tools to call.
    schema_attribute :tools

    attr_reader :attributes

    # @param experimental [Hash] (nil)
    #   Experimental, non-standard capabilities that the server supports.
    # @param logging [object] (nil)
    #   Present if the server supports sending log messages to the client.
    # @param prompts [Hash] (nil)
    #   Present if the server offers any prompt templates.
    # @param resources [Hash] (nil)
    #   Present if the server offers any resources to read.
    # @param tools [Hash] (nil) Present if the server offers any tools to call.
    def initialize(experimental: nil, logging: nil, prompts: nil, resources: nil, tools: nil, **kwargs)
      @attributes = { experimental: experimental, logging: logging, prompts: prompts, resources: resources, tools: tools }.merge(kwargs)
    end
  end
end