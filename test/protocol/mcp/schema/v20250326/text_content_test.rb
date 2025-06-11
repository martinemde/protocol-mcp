# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class TextContentTest < Minitest::Test
      def setup
      @annotations = nil
      @text = "test_text"
  end

  def test_initialize_with_all_params
    text_content = TextContent.new(
      annotations: @annotations,
        text: @text
    )

    assert_equal @annotations, text_content.annotations
    assert_equal @text, text_content.text
  end

  def test_initialize_with_required_params_only
    text_content = TextContent.new(
      text: @text
    )

    assert_equal @text, text_content.text
    assert_nil text_content.annotations
  end

def test_initialize_requires_text
  error = assert_raises(ArgumentError) do
    TextContent.new(
      
    )
  end
  assert_match(/missing keyword: :?text/, error.message)
end

def test_text_attribute_reader
  text_content = TextContent.new(text: @text)
  assert_equal @text, text_content.text
end

def test_annotations_attribute_reader
  text_content = TextContent.new(annotations: @annotations, text: @text)
  assert_equal @annotations, text_content.annotations
end

  end
end
