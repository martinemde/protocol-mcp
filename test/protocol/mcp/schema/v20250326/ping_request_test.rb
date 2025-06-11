# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class PingRequestTest < Minitest::Test
    def test_initialize_with_no_params
      request = PingRequest.new

      assert_equal "ping", request.method
      assert_equal({}, request.params)
    end

    def test_initialize_with_custom_params
      custom_params = { custom_field: "value" }
      request = PingRequest.new(**custom_params)

      assert_equal "ping", request.method
      assert_equal custom_params, request.params
    end

    def test_method_is_ping
      request = PingRequest.new
      assert_equal "ping", request.method
    end

    def test_params_attribute_reader
      request = PingRequest.new
      assert_equal({}, request.params)
    end
  end
end
