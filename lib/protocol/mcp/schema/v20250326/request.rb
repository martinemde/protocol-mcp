# frozen_string_literal: true

# Translated from original TypeScript source:
# 
# ```ts
# export interface Request {
#   method: string;
#   params?: {
#     _meta?: {
#       /**
#        * If specified, the caller is requesting out-of-band progress notifications for this request (as represented by notifications/progress). The value of this parameter is an opaque token that will be attached to any subsequent notifications. The receiver is not obligated to provide these notifications.
#        */
#       progressToken?: ProgressToken;
#     };
#     [key: string]: unknown;
#   };
# }
# ```
module Protocol::Mcp::Schema::V20250326
  class Request < Protocol::Jsonrpc::Request
    include Protocol::Mcp::Schema::Type

  end
end