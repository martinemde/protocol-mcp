# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ClientCapabilities {
#   /**
#    * Experimental, non-standard capabilities that the client supports.
#    */
#   experimental?: { [key: string]: object };
#   /**
#    * Present if the client supports listing roots.
#    */
#   roots?: {
#     /**
#      * Whether the client supports notifications for changes to the roots list.
#      */
#     listChanged?: boolean;
#   };
#   /**
#    * Present if the client supports sampling from an LLM.
#    */
#   sampling?: object;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # Capabilities a client may support. Known capabilities are defined here, in this schema, but this is not a closed set: any client can define its own, additional capabilities.
  class ClientCapabilities
    include Protocol::Mcp::Schema::Type

    # Experimental, non-standard capabilities that the client supports.
    schema_attribute :experimental, optional: true

    # Present if the client supports listing roots.
    schema_attribute :roots, optional: true

    # Present if the client supports sampling from an LLM.
    schema_attribute :sampling, optional: true

    attr_reader :attributes

    # @param experimental [Hash] (nil)
    #   Experimental, non-standard capabilities that the client supports.
    # @param roots [Hash] (nil) Present if the client supports listing roots.
    # @param sampling [object] (nil)
    #   Present if the client supports sampling from an LLM.
    def initialize(experimental: nil, roots: nil, sampling: nil, **kwargs)
      @attributes = { experimental: experimental, roots: roots, sampling: sampling }.merge(kwargs)
    end
  end
end