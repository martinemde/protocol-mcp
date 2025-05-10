# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface PaginatedResult extends Result {
#   /**
#    * An opaque token representing the pagination position after the last returned result.
#    * If present, there may be more results available.
#    */
#   nextCursor?: Cursor;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  class PaginatedResult < Result

    # An opaque token representing the pagination position after the last returned result.
    # If present, there may be more results available.
    attr_reader :next_cursor

    # @param next_cursor [Cursor] (nil)
    #   An opaque token representing the pagination position after the last returned result.
    #   If present, there may be more results available.
    def initialize(next_cursor: nil, **kwargs)
      @next_cursor = next_cursor
      super(**kwargs)
    end
  end
end