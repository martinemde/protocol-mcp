# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ReadResourceResult extends Result {
#   contents: (TextResourceContents | BlobResourceContents)[];
# }
# ```
module Protocol::Mcp::Schema::V20241105
  # The server's response to a resources/read request from the client.
  class ReadResourceResult < Result
    include ServerResult

    schema_attribute :contents

    def initialize(contents:, **kwargs)
      super(contents: contents, **kwargs)
    end
  end
end