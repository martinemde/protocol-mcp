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
module Protocol::Mcp::Schema::V20241105
  class PaginatedRequest < Request
    include Protocol::Mcp::Schema::Type

    schema_attribute :params, optional: true

    def initialize(params: nil, **kwargs)
      super(params: params, **kwargs)
    end
  end
end