# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface ReadResourceResult extends Result {
#   contents: (TextResourceContents | BlobResourceContents)[];
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # The server's response to a resources/read request from the client.
  class ReadResourceResult < Result
    include ServerResult

    attr_reader :contents

    def initialize(contents:, **kwargs)
      @contents = contents
      super(**kwargs)
    end
  end
end