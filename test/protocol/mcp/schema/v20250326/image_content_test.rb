# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ImageContentTest < Minitest::Test
      def setup
      @annotations = nil
      @data = "test_data"
      @mime_type = "test_value"
  end

  def test_initialize_with_all_params
    image_content = ImageContent.new(
      annotations: @annotations,
        data: @data,
        mime_type: @mime_type
    )

    assert_equal @annotations, image_content.annotations
    assert_equal @data, image_content.data
    assert_equal @mime_type, image_content.mime_type
  end

  def test_initialize_with_required_params_only
    image_content = ImageContent.new(
      data: @data,
        mime_type: @mime_type
    )

    assert_equal @data, image_content.data
    assert_equal @mime_type, image_content.mime_type
    assert_nil image_content.annotations
  end

def test_initialize_requires_data
  error = assert_raises(ArgumentError) do
    ImageContent.new(
      mime_type: @mime_type
    )
  end
  assert_match(/missing keyword: :?data/, error.message)
end

def test_initialize_requires_mime_type
  error = assert_raises(ArgumentError) do
    ImageContent.new(
      data: @data
    )
  end
  assert_match(/missing keyword: :?mime_type/, error.message)
end

def test_data_attribute_reader
  image_content = ImageContent.new(data: @data, mime_type: @mime_type)
  assert_equal @data, image_content.data
end

def test_mime_type_attribute_reader
  image_content = ImageContent.new(mime_type: @mime_type, data: @data)
  assert_equal @mime_type, image_content.mime_type
end

def test_annotations_attribute_reader
  image_content = ImageContent.new(annotations: @annotations, data: @data, mime_type: @mime_type)
  assert_equal @annotations, image_content.annotations
end

  end
end
