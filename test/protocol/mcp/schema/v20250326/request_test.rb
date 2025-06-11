# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class RequestTest < Minitest::Test
    def setup
      @method = "test_method"
      @params = { param1: "value1", param2: 42 }
    end

    def test_initialize_with_all_params
      request = Request.new(
        method: @method,
        params: @params
      )

      assert_equal @method, request.method
      assert_equal @params, request.params
    end

    def test_initialize_with_required_params_only
      request = Request.new(method: @method)

      assert_equal @method, request.method
      assert_nil request.params
    end

    def test_initialize_requires_method
      error = assert_raises(ArgumentError) do
        Request.new
      end
      assert_match(/missing keyword: :?method/, error.message)
    end

    def test_method_attribute_reader
      request = Request.new(method: @method)
      assert_equal @method, request.method
    end

    def test_params_attribute_reader
      request = Request.new(method: @method, params: @params)
      assert_equal @params, request.params
    end
  end
end
