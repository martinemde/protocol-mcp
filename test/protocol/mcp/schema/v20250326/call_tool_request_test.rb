# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class CallToolRequestTest < Minitest::Test
    def setup
      @name = "test_tool"
      @arguments = { param1: "value1", param2: 42 }
    end

    def test_initialize_with_all_params
      request = CallToolRequest.new(
        name: @name,
        arguments: @arguments
      )

      assert_equal "tools/call", request.method
      assert_equal @name, request.name
      assert_equal @arguments, request.arguments
      assert_equal(
        {
          name: @name,
          arguments: @arguments
        },
        request.params
      )
    end

    def test_initialize_with_required_params_only
      request = CallToolRequest.new(name: @name)

      assert_equal "tools/call", request.method
      assert_equal @name, request.name
      assert_nil request.arguments
      assert_equal(
        {
          name: @name,
          arguments: nil
        },
        request.params
      )
    end

    def test_initialize_requires_name
      error = assert_raises(ArgumentError) do
        CallToolRequest.new
      end
      assert_match(/missing keyword: :?name/, error.message)
    end

    def test_name_attribute_reader
      request = CallToolRequest.new(name: @name)
      assert_equal @name, request.name
    end

    def test_arguments_attribute_reader
      request = CallToolRequest.new(name: @name, arguments: @arguments)
      assert_equal @arguments, request.arguments
    end
  end
end
