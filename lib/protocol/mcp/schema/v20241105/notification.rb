# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface Notification {
#   method: string;
#   params?: {
#     /**
#      * This parameter name is reserved by MCP to allow clients and servers to attach additional metadata to their notifications.
#      */
#     _meta?: { [key: string]: unknown };
#     [key: string]: unknown;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20241105
  class Notification < Protocol::Jsonrpc::Notification
    include Protocol::Mcp::Schema::Type

  end
end