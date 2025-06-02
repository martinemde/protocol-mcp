# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface CallToolResult extends Result {
#   content: (TextContent | ImageContent | AudioContent | EmbeddedResource)[];
# 
#   /**
#    * Whether the tool call ended in an error.
#    *
#    * If not set, this is assumed to be false (the call was successful).
#    */
#   isError?: boolean;
# }
# ```
module Protocol::Mcp::Schema::V20250326
  # The server's response to a tool call.
  # 
  # Any errors that originate from the tool SHOULD be reported inside the result
  # object, with `isError` set to true, _not_ as an MCP protocol-level error
  # response. Otherwise, the LLM would not be able to see that an error occurred
  # and self-correct.
  # 
  # However, any errors in _finding_ the tool, an error indicating that the
  # server does not support tool calls, or any other exceptional conditions,
  # should be reported as an MCP error response.
  class CallToolResult < Result
    include Protocol::Mcp::Schema::Type
    include ServerResult

    schema_attribute :content

    # Whether the tool call ended in an error.
    # 
    # If not set, this is assumed to be false (the call was successful).
    schema_attribute :is_error

    # @param is_error [Boolean] (nil) Whether the tool call ended in an error.
    #   If not set, this is assumed to be false (the call was successful).
    def initialize(content:, is_error: nil, **kwargs)
      super(content: content, is_error: is_error, **kwargs)
    end
  end
end