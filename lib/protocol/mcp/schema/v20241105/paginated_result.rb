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
module Protocol::Mcp::Schema::V20241105
  class PaginatedResult < Result
    include Protocol::Mcp::Schema::Type

    # An opaque token representing the pagination position after the last returned result.
    # If present, there may be more results available.
    schema_attribute :next_cursor

    # @param next_cursor [Cursor] (nil)
    #   An opaque token representing the pagination position after the last returned result.
    #   If present, there may be more results available.
    def initialize(next_cursor: nil, **kwargs)
      super(next_cursor: next_cursor, **kwargs)
    end
  end
end