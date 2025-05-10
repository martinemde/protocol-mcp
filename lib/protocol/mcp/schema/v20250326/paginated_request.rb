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

    attr_reader :params

    def initialize(params: nil, **kwargs)
      @params = params
      super(**kwargs)
    end
  end
end