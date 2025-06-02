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

    schema_attribute :params

    def initialize(params: nil, **kwargs)
      super(params: params, **kwargs)
    end
  end
end