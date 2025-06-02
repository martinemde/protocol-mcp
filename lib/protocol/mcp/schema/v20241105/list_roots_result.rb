# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ListRootsResult extends Result {
#   roots: Root[];
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # The client's response to a roots/list request from the server.
  # This result contains an array of Root objects, each representing a root directory
  # or file that the server can operate on.
  class ListRootsResult < Result
    include Protocol::Mcp::Schema::Type
    include ClientResult

    schema_attribute :roots

    def initialize(roots:, **kwargs)
      super(roots: roots, **kwargs)
    end
  end
end