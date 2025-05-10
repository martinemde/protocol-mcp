# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface Result {
#   /**
#    * This result property is reserved by the protocol to allow clients and servers to attach additional metadata to their responses.
#    */
#   _meta?: { [key: string]: unknown };
#   [key: string]: unknown;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  class Result

    # This result property is reserved by the protocol to allow clients and servers to attach additional metadata to their responses.
    attr_reader :_meta

    # @param _meta [Hash] (nil)
    #   This result property is reserved by the protocol to allow clients and servers to attach additional metadata to their responses.
    def initialize(_meta: nil)
      @_meta = _meta
    end
  end
end