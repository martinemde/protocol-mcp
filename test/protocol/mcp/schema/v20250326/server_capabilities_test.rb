# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ServerCapabilitiesTest < Minitest::Test
      def setup
      @experimental = nil
      @logging = nil
      @completions = nil
      @prompts = [{ name: "test" }]
      @resources = [{ name: "test" }]
      @tools = [{ name: "test" }]
  end

  def test_initialize_with_all_params
    server_capabilities = ServerCapabilities.new(
      experimental: @experimental,
        logging: @logging,
        completions: @completions,
        prompts: @prompts,
        resources: @resources,
        tools: @tools
    )

    assert_equal @experimental, server_capabilities.experimental
    assert_equal @logging, server_capabilities.logging
    assert_equal @completions, server_capabilities.completions
    assert_equal @prompts, server_capabilities.prompts
    assert_equal @resources, server_capabilities.resources
    assert_equal @tools, server_capabilities.tools
  end

def test_experimental_attribute_reader
  server_capabilities = ServerCapabilities.new(experimental: @experimental)
  assert_equal @experimental, server_capabilities.experimental
end

def test_logging_attribute_reader
  server_capabilities = ServerCapabilities.new(logging: @logging)
  assert_equal @logging, server_capabilities.logging
end

def test_completions_attribute_reader
  server_capabilities = ServerCapabilities.new(completions: @completions)
  assert_equal @completions, server_capabilities.completions
end

def test_prompts_attribute_reader
  server_capabilities = ServerCapabilities.new(prompts: @prompts)
  assert_equal @prompts, server_capabilities.prompts
end

def test_resources_attribute_reader
  server_capabilities = ServerCapabilities.new(resources: @resources)
  assert_equal @resources, server_capabilities.resources
end

def test_tools_attribute_reader
  server_capabilities = ServerCapabilities.new(tools: @tools)
  assert_equal @tools, server_capabilities.tools
end

  end
end
