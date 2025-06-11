# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class CallToolResultTest < Minitest::Test
      def setup
      @is_error = nil
      @content = { type: "text", text: "test" }
  end

  def test_initialize_with_all_params
    call_tool_result = CallToolResult.new(
      is_error: @is_error,
        content: @content
    )

    assert_equal @is_error, call_tool_result.is_error
    assert_equal @content, call_tool_result.content
  end

  def test_initialize_with_required_params_only
    call_tool_result = CallToolResult.new(
      content: @content
    )

    assert_equal @content, call_tool_result.content
    assert_nil call_tool_result.is_error
  end

def test_initialize_requires_content
  error = assert_raises(ArgumentError) do
    CallToolResult.new(
      
    )
  end
  assert_match(/missing keyword: :?content/, error.message)
end

def test_content_attribute_reader
  call_tool_result = CallToolResult.new(content: @content)
  assert_equal @content, call_tool_result.content
end

def test_is_error_attribute_reader
  call_tool_result = CallToolResult.new(is_error: @is_error, content: @content)
  assert_equal @is_error, call_tool_result.is_error
end

def test_inherits_from_result
  call_tool_result = CallToolResult.new(content: @content)
  assert_kind_of Result, call_tool_result
end

  end
end
