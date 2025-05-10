# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20241105
  class InitializeRequestTest < Minitest::Test
    def setup
      @protocol_version = "2024-11-05"
      @capabilities = { some_capability: true }
      @client_info = { name: "test_client", version: "1.0.0" }
    end

    def test_initialize_with_valid_params
      request = InitializeRequest.new(
        protocol_version: @protocol_version,
        capabilities: @capabilities,
        client_info: @client_info
      )

      assert_equal "initialize", request.method
      assert_equal @protocol_version, request.protocol_version
      assert_equal @capabilities, request.capabilities
      assert_equal @client_info, request.client_info
      assert_equal(
        {
          protocolVersion: @protocol_version,
          capabilities: @capabilities,
          clientInfo: @client_info
        },
        request.params
      )
    end

    def test_initialize_requires_protocol_version
      error = assert_raises(ArgumentError) do
        InitializeRequest.new(
          capabilities: @capabilities,
          client_info: @client_info
        )
      end
      assert_match(/missing keyword: :?protocol_version/, error.message)
    end

    def test_initialize_requires_capabilities
      error = assert_raises(ArgumentError) do
        InitializeRequest.new(
          protocol_version: @protocol_version,
          client_info: @client_info
        )
      end
      assert_match(/missing keyword: :?capabilities/, error.message)
    end

    def test_initialize_requires_client_info
      error = assert_raises(ArgumentError) do
        InitializeRequest.new(
          protocol_version: @protocol_version,
          capabilities: @capabilities
        )
      end
      assert_match(/missing keyword: :?client_info/, error.message)
    end
  end
end
