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

    # Experimental, non-standard capabilities that the client supports.
    attr_reader :experimental

    # Present if the client supports listing roots.
    attr_reader :roots

    # Present if the client supports sampling from an LLM.
    attr_reader :sampling

    # @param experimental [Hash] (nil)
    #   Experimental, non-standard capabilities that the client supports.
    # @param roots [Hash] (nil) Present if the client supports listing roots.
    # @param sampling [object] (nil)
    #   Present if the client supports sampling from an LLM.
    def initialize(experimental: nil, roots: nil, sampling: nil)
      @experimental = experimental
      @roots = roots
      @sampling = sampling
    end
  end
end