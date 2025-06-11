# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface PaginatedRequest extends Request {
#   params?: {
#     /**
#      * An opaque token representing the current pagination position.
#      * If provided, the server should return results starting after this cursor.
#      */
#     cursor?: Cursor;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20250326
  class PaginatedRequest < Request
    include Protocol::Mcp::Schema::Type

    # An opaque token representing the current pagination position.
    # If provided, the server should return results starting after this cursor.
    params_attribute :cursor, optional: true

    # @param cursor [Cursor] (nil)
    #   An opaque token representing the current pagination position.
    #   If provided, the server should return results starting after this cursor.
    def initialize(method:, params:)
      super(method:, params:)
    end
  end
end