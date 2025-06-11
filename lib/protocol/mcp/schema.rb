# frozen_string_literal: true

require "protocol/jsonrpc"

module Protocol::Mcp
  module Schema
    autoload :Type, "protocol/mcp/schema/type"
    autoload :V20241105, "protocol/mcp/schema/v20241105"
    autoload :V20250326, "protocol/mcp/schema/v20250326"
  end
end
