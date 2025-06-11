# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class PromptMessageTest < Minitest::Test
      def setup
      @role = "user"
      @content = { type: "text", text: "test" }
  end

  def test_initialize_with_all_params
    prompt_message = PromptMessage.new(
      role: @role,
        content: @content
    )

    assert_equal @role, prompt_message.role
    assert_equal @content, prompt_message.content
  end

def test_initialize_requires_role
  error = assert_raises(ArgumentError) do
    PromptMessage.new(
      content: @content
    )
  end
  assert_match(/missing keyword: :?role/, error.message)
end

def test_initialize_requires_content
  error = assert_raises(ArgumentError) do
    PromptMessage.new(
      role: @role
    )
  end
  assert_match(/missing keyword: :?content/, error.message)
end

def test_role_attribute_reader
  prompt_message = PromptMessage.new(role: @role, content: @content)
  assert_equal @role, prompt_message.role
end

def test_content_attribute_reader
  prompt_message = PromptMessage.new(content: @content, role: @role)
  assert_equal @content, prompt_message.content
end

  end
end
