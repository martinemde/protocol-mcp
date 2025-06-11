# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class InitializeResultTest < Minitest::Test
      def setup
      @instructions = nil
      @protocol_version = "2025-03-26"
      @capabilities = { test: true }
      @server_info = "test_value"
  end

  def test_initialize_with_all_params
    initialize_result = InitializeResult.new(
      instructions: @instructions,
        protocol_version: @protocol_version,
        capabilities: @capabilities,
        server_info: @server_info
    )

    assert_equal @instructions, initialize_result.instructions
    assert_equal @protocol_version, initialize_result.protocol_version
    assert_equal @capabilities, initialize_result.capabilities
    assert_equal @server_info, initialize_result.server_info
  end

  def test_initialize_with_required_params_only
    initialize_result = InitializeResult.new(
      protocol_version: @protocol_version,
        capabilities: @capabilities,
        server_info: @server_info
    )

    assert_equal @protocol_version, initialize_result.protocol_version
    assert_equal @capabilities, initialize_result.capabilities
    assert_equal @server_info, initialize_result.server_info
    assert_nil initialize_result.instructions
  end

def test_initialize_requires_protocol_version
  error = assert_raises(ArgumentError) do
    InitializeResult.new(
      capabilities: @capabilities,
          server_info: @server_info
    )
  end
  assert_match(/missing keyword: :?protocol_version/, error.message)
end

def test_initialize_requires_capabilities
  error = assert_raises(ArgumentError) do
    InitializeResult.new(
      protocol_version: @protocol_version,
          server_info: @server_info
    )
  end
  assert_match(/missing keyword: :?capabilities/, error.message)
end

def test_initialize_requires_server_info
  error = assert_raises(ArgumentError) do
    InitializeResult.new(
      protocol_version: @protocol_version,
          capabilities: @capabilities
    )
  end
  assert_match(/missing keyword: :?server_info/, error.message)
end

def test_protocol_version_attribute_reader
  initialize_result = InitializeResult.new(protocol_version: @protocol_version, capabilities: @capabilities, server_info: @server_info)
  assert_equal @protocol_version, initialize_result.protocol_version
end

def test_capabilities_attribute_reader
  initialize_result = InitializeResult.new(capabilities: @capabilities, protocol_version: @protocol_version, server_info: @server_info)
  assert_equal @capabilities, initialize_result.capabilities
end

def test_server_info_attribute_reader
  initialize_result = InitializeResult.new(server_info: @server_info, protocol_version: @protocol_version, capabilities: @capabilities)
  assert_equal @server_info, initialize_result.server_info
end

def test_instructions_attribute_reader
  initialize_result = InitializeResult.new(instructions: @instructions, protocol_version: @protocol_version, capabilities: @capabilities, server_info: @server_info)
  assert_equal @instructions, initialize_result.instructions
end

def test_inherits_from_result
  initialize_result = InitializeResult.new(protocol_version: @protocol_version, capabilities: @capabilities, server_info: @server_info)
  assert_kind_of Result, initialize_result
end

  end
end
