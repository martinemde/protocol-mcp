# frozen_string_literal: true

require "test_helper"
require "protocol/mcp/schema/v20250326"

module Protocol
  module Mcp
    module Schema
      class V20241105Test < Minitest::Test
        def test_all_constants_exist
          constants = [
            Protocol::Mcp::Schema::V20250326::AudioContent,
            Protocol::Mcp::Schema::V20250326::CreateMessageRequest,
            Protocol::Mcp::Schema::V20250326::LoggingMessageNotification,
            Protocol::Mcp::Schema::V20250326::ListPromptsRequest,
            Protocol::Mcp::Schema::V20250326::ServerRequest,
            Protocol::Mcp::Schema::V20250326::JSONRPCRequest,
            Protocol::Mcp::Schema::V20250326::SetLevelRequest,
            Protocol::Mcp::Schema::V20250326::CreateMessageResult,
            Protocol::Mcp::Schema::V20250326::Result,
            Protocol::Mcp::Schema::V20250326::Root,
            Protocol::Mcp::Schema::V20250326::PromptArgument,
            Protocol::Mcp::Schema::V20250326::ListToolsRequest,
            Protocol::Mcp::Schema::V20250326::Resource,
            Protocol::Mcp::Schema::V20250326::InitializeRequest,
            Protocol::Mcp::Schema::V20250326::JSONRPCError,
            Protocol::Mcp::Schema::V20250326::CompleteResult,
            Protocol::Mcp::Schema::V20250326::ClientCapabilities,
            Protocol::Mcp::Schema::V20250326::JSONRPCNotification,
            Protocol::Mcp::Schema::V20250326::ImageContent,
            Protocol::Mcp::Schema::V20250326::GetPromptRequest,
            Protocol::Mcp::Schema::V20250326::GetPromptResult,
            Protocol::Mcp::Schema::V20250326::InitializeResult,
            Protocol::Mcp::Schema::V20250326::LoggingLevel,
            Protocol::Mcp::Schema::V20250326::UnsubscribeRequest,
            Protocol::Mcp::Schema::V20250326::ListResourceTemplatesResult,
            Protocol::Mcp::Schema::V20250326::JSONRPCBatchResponse,
            Protocol::Mcp::Schema::V20250326::ResourceContents,
            Protocol::Mcp::Schema::V20250326::Request,
            Protocol::Mcp::Schema::V20250326::PaginatedRequest,
            Protocol::Mcp::Schema::V20250326::ListResourceTemplatesRequest,
            Protocol::Mcp::Schema::V20250326::EmptyResult,
            Protocol::Mcp::Schema::V20250326::CallToolResult,
            Protocol::Mcp::Schema::V20250326::InitializedNotification,
            Protocol::Mcp::Schema::V20250326::ResourceTemplate,
            Protocol::Mcp::Schema::V20250326::BlobResourceContents,
            Protocol::Mcp::Schema::V20250326::ResourceReference,
            Protocol::Mcp::Schema::V20250326::EmbeddedResource,
            Protocol::Mcp::Schema::V20250326::ServerCapabilities,
            Protocol::Mcp::Schema::V20250326::ListResourcesRequest,
            Protocol::Mcp::Schema::V20250326::JSONRPCMessage,
            Protocol::Mcp::Schema::V20250326::Notification,
            Protocol::Mcp::Schema::V20250326::ProgressToken,
            Protocol::Mcp::Schema::V20250326::ReadResourceResult,
            Protocol::Mcp::Schema::V20250326::TextResourceContents,
            Protocol::Mcp::Schema::V20250326::PingRequest,
            Protocol::Mcp::Schema::V20250326::PromptReference,
            Protocol::Mcp::Schema::V20250326::ServerNotification,
            Protocol::Mcp::Schema::V20250326::ListPromptsResult,
            Protocol::Mcp::Schema::V20250326::ListRootsRequest,
            Protocol::Mcp::Schema::V20250326::CancelledNotification,
            Protocol::Mcp::Schema::V20250326::Prompt,
            Protocol::Mcp::Schema::V20250326::CallToolRequest,
            Protocol::Mcp::Schema::V20250326::JSONRPCBatchRequest,
            Protocol::Mcp::Schema::V20250326::Implementation,
            Protocol::Mcp::Schema::V20250326::Role,
            Protocol::Mcp::Schema::V20250326::ToolAnnotations,
            Protocol::Mcp::Schema::V20250326::ReadResourceRequest,
            Protocol::Mcp::Schema::V20250326::Tool,
            Protocol::Mcp::Schema::V20250326::ClientRequest,
            Protocol::Mcp::Schema::V20250326::ToolListChangedNotification,
            Protocol::Mcp::Schema::V20250326::PaginatedResult,
            Protocol::Mcp::Schema::V20250326::Annotations,
            Protocol::Mcp::Schema::V20250326::PromptMessage,
            Protocol::Mcp::Schema::V20250326::SamplingMessage,
            Protocol::Mcp::Schema::V20250326::ListToolsResult,
            Protocol::Mcp::Schema::V20250326::RequestId,
            Protocol::Mcp::Schema::V20250326::ResourceUpdatedNotification,
            Protocol::Mcp::Schema::V20250326::ClientResult,
            Protocol::Mcp::Schema::V20250326::ServerResult,
            Protocol::Mcp::Schema::V20250326::Cursor,
            Protocol::Mcp::Schema::V20250326::CompleteRequest,
            Protocol::Mcp::Schema::V20250326::ListRootsResult,
            Protocol::Mcp::Schema::V20250326::ResourceListChangedNotification,
            Protocol::Mcp::Schema::V20250326::PromptListChangedNotification,
            Protocol::Mcp::Schema::V20250326::SubscribeRequest,
            Protocol::Mcp::Schema::V20250326::ModelPreferences,
            Protocol::Mcp::Schema::V20250326::TextContent,
            Protocol::Mcp::Schema::V20250326::ListResourcesResult,
            Protocol::Mcp::Schema::V20250326::ModelHint,
            Protocol::Mcp::Schema::V20250326::ClientNotification,
            Protocol::Mcp::Schema::V20250326::JSONRPCResponse,
            Protocol::Mcp::Schema::V20250326::RootsListChangedNotification,
            Protocol::Mcp::Schema::V20250326::ProgressNotification,
          ]

          constants.each do |constant|
            assert constant.name
          end
        end
      end
    end
  end
end
