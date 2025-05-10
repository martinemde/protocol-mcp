# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ListRootsRequest extends Request {
#   method: "roots/list";
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # Sent from the server to request a list of root URIs from the client. Roots allow
  # servers to ask for specific directories or files to operate on. A common example
  # for roots is providing a set of repositories or directories a server should operate
  # on.
  # 
  # This request is typically used when the server needs to understand the file system
  # structure or access specific locations that the client has permission to read from.
  class ListRootsRequest < Request
    include ServerRequest

    def initialize(**params)
      super(method: "roots/list", params:)
    end
  end
end