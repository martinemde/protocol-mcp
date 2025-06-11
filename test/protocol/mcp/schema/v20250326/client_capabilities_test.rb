# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ClientCapabilitiesTest < Minitest::Test
      def setup
      @experimental = nil
      @roots = [{ name: "test" }]
      @sampling = nil
  end

  def test_initialize_with_all_params
    client_capabilities = ClientCapabilities.new(
      experimental: @experimental,
        roots: @roots,
        sampling: @sampling
    )

    assert_equal @experimental, client_capabilities.experimental
    assert_equal @roots, client_capabilities.roots
    assert_equal @sampling, client_capabilities.sampling
  end

def test_experimental_attribute_reader
  client_capabilities = ClientCapabilities.new(experimental: @experimental)
  assert_equal @experimental, client_capabilities.experimental
end

def test_roots_attribute_reader
  client_capabilities = ClientCapabilities.new(roots: @roots)
  assert_equal @roots, client_capabilities.roots
end

def test_sampling_attribute_reader
  client_capabilities = ClientCapabilities.new(sampling: @sampling)
  assert_equal @sampling, client_capabilities.sampling
end

  end
end
