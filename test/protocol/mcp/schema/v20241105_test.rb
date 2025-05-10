# frozen_string_literal: true

require "test_helper"
require "protocol/mcp/schema/v20241105"

module Protocol
  module Mcp
    module Schema
      class V20241105Test < Minitest::Test
        def test_all_constants_exist
          constants = [
            Protocol::Mcp::Schema::V20241105::Annotated,
            Protocol::Mcp::Schema::V20241105::BlobResourceContents,
            Protocol::Mcp::Schema::V20241105::CallToolRequest,
            Protocol::Mcp::Schema::V20241105::CallToolResult,
            Protocol::Mcp::Schema::V20241105::CancelledNotification,
            Protocol::Mcp::Schema::V20241105::ClientCapabilities,
            Protocol::Mcp::Schema::V20241105::ClientNotification,
            Protocol::Mcp::Schema::V20241105::ClientRequest,
            Protocol::Mcp::Schema::V20241105::ClientResult,
            Protocol::Mcp::Schema::V20241105::CompleteRequest,
            Protocol::Mcp::Schema::V20241105::CompleteResult,
            Protocol::Mcp::Schema::V20241105::CreateMessageRequest,
            Protocol::Mcp::Schema::V20241105::CreateMessageResult,
            Protocol::Mcp::Schema::V20241105::Cursor,
            Protocol::Mcp::Schema::V20241105::EmbeddedResource,
            Protocol::Mcp::Schema::V20241105::EmptyResult,
            Protocol::Mcp::Schema::V20241105::GetPromptRequest,
            Protocol::Mcp::Schema::V20241105::GetPromptResult,
            Protocol::Mcp::Schema::V20241105::ImageContent,
            Protocol::Mcp::Schema::V20241105::Implementation,
            Protocol::Mcp::Schema::V20241105::InitializeRequest,
            Protocol::Mcp::Schema::V20241105::InitializeResult,
            Protocol::Mcp::Schema::V20241105::InitializedNotification,
            Protocol::Mcp::Schema::V20241105::JSONRPCError,
            Protocol::Mcp::Schema::V20241105::JSONRPCMessage,
            Protocol::Mcp::Schema::V20241105::JSONRPCNotification,
            Protocol::Mcp::Schema::V20241105::JSONRPCRequest,
            Protocol::Mcp::Schema::V20241105::JSONRPCResponse,
            Protocol::Mcp::Schema::V20241105::ListPromptsRequest,
            Protocol::Mcp::Schema::V20241105::ListPromptsResult,
            Protocol::Mcp::Schema::V20241105::ListResourceTemplatesRequest,
            Protocol::Mcp::Schema::V20241105::ListResourceTemplatesResult,
            Protocol::Mcp::Schema::V20241105::ListResourcesRequest,
            Protocol::Mcp::Schema::V20241105::ListResourcesResult,
            Protocol::Mcp::Schema::V20241105::ListRootsRequest,
            Protocol::Mcp::Schema::V20241105::ListRootsResult,
            Protocol::Mcp::Schema::V20241105::ListToolsRequest,
            Protocol::Mcp::Schema::V20241105::ListToolsResult,
            Protocol::Mcp::Schema::V20241105::LoggingLevel,
            Protocol::Mcp::Schema::V20241105::LoggingMessageNotification,
            Protocol::Mcp::Schema::V20241105::ModelHint,
            Protocol::Mcp::Schema::V20241105::ModelPreferences,
            Protocol::Mcp::Schema::V20241105::Notification,
            Protocol::Mcp::Schema::V20241105::PaginatedRequest,
            Protocol::Mcp::Schema::V20241105::PaginatedResult,
            Protocol::Mcp::Schema::V20241105::PingRequest,
            Protocol::Mcp::Schema::V20241105::ProgressNotification,
            Protocol::Mcp::Schema::V20241105::ProgressToken,
            Protocol::Mcp::Schema::V20241105::Prompt,
            Protocol::Mcp::Schema::V20241105::PromptArgument,
            Protocol::Mcp::Schema::V20241105::PromptListChangedNotification,
            Protocol::Mcp::Schema::V20241105::PromptMessage,
            Protocol::Mcp::Schema::V20241105::PromptReference,
            Protocol::Mcp::Schema::V20241105::ReadResourceRequest,
            Protocol::Mcp::Schema::V20241105::ReadResourceResult,
            Protocol::Mcp::Schema::V20241105::Request,
            Protocol::Mcp::Schema::V20241105::RequestId,
            Protocol::Mcp::Schema::V20241105::Resource,
            Protocol::Mcp::Schema::V20241105::ResourceContents,
            Protocol::Mcp::Schema::V20241105::ResourceListChangedNotification,
            Protocol::Mcp::Schema::V20241105::ResourceReference,
            Protocol::Mcp::Schema::V20241105::ResourceTemplate,
            Protocol::Mcp::Schema::V20241105::ResourceUpdatedNotification,
            Protocol::Mcp::Schema::V20241105::Result,
            Protocol::Mcp::Schema::V20241105::Role,
            Protocol::Mcp::Schema::V20241105::Root,
            Protocol::Mcp::Schema::V20241105::RootsListChangedNotification,
            Protocol::Mcp::Schema::V20241105::SamplingMessage,
            Protocol::Mcp::Schema::V20241105::ServerCapabilities,
            Protocol::Mcp::Schema::V20241105::ServerNotification,
            Protocol::Mcp::Schema::V20241105::ServerRequest,
            Protocol::Mcp::Schema::V20241105::ServerResult,
            Protocol::Mcp::Schema::V20241105::SetLevelRequest,
            Protocol::Mcp::Schema::V20241105::SubscribeRequest,
            Protocol::Mcp::Schema::V20241105::TextContent,
            Protocol::Mcp::Schema::V20241105::TextResourceContents,
            Protocol::Mcp::Schema::V20241105::Tool,
            Protocol::Mcp::Schema::V20241105::ToolListChangedNotification,
            Protocol::Mcp::Schema::V20241105::UnsubscribeRequest,
          ]

          constants.each do |constant|
            assert constant.name
          end
        end
      end
    end
  end
end
