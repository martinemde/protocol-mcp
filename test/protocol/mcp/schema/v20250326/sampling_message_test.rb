# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class SamplingMessageTest < Minitest::Test
      def setup
      @role = "user"
      @content = { type: "text", text: "test" }
  end

  def test_initialize_with_all_params
    sampling_message = SamplingMessage.new(
      role: @role,
        content: @content
    )

    assert_equal @role, sampling_message.role
    assert_equal @content, sampling_message.content
  end

def test_initialize_requires_role
  error = assert_raises(ArgumentError) do
    SamplingMessage.new(
      content: @content
    )
  end
  assert_match(/missing keyword: :?role/, error.message)
end

def test_initialize_requires_content
  error = assert_raises(ArgumentError) do
    SamplingMessage.new(
      role: @role
    )
  end
  assert_match(/missing keyword: :?content/, error.message)
end

def test_role_attribute_reader
  sampling_message = SamplingMessage.new(role: @role, content: @content)
  assert_equal @role, sampling_message.role
end

def test_content_attribute_reader
  sampling_message = SamplingMessage.new(content: @content, role: @role)
  assert_equal @content, sampling_message.content
end

  end
end
