# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface CompleteResult extends Result {
#   completion: {
#     /**
#      * An array of completion values. Must not exceed 100 items.
#      */
#     values: string[];
#     /**
#      * The total number of completion options available. This can exceed the number of values actually sent in the response.
#      */
#     total?: number;
#     /**
#      * Indicates whether there are additional completion options beyond those provided in the current response, even if the exact total is unknown.
#      */
#     hasMore?: boolean;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # The server's response to a completion/complete request
  class CompleteResult < Result
    include Protocol::Mcp::Schema::Type
    include ServerResult

    schema_attribute :completion

    def initialize(completion:, **kwargs)
      super(completion: completion, **kwargs)
    end
  end
end