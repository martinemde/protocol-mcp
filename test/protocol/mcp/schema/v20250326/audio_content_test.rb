# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class AudioContentTest < Minitest::Test
    def setup
      @annotations = nil
      @data = "test_data"
      @mime_type = "test_value"
    end

    def test_initialize_with_all_params
      audio_content = AudioContent.new(
        annotations: @annotations,
          data: @data,
          mime_type: @mime_type
      )

      assert_equal @annotations, audio_content.annotations
      assert_equal @data, audio_content.data
      assert_equal @mime_type, audio_content.mime_type
    end

    def test_initialize_with_required_params_only
      audio_content = AudioContent.new(
        data: @data,
          mime_type: @mime_type
      )

      assert_equal @data, audio_content.data
      assert_equal @mime_type, audio_content.mime_type
      assert_nil audio_content.annotations
    end

    def test_initialize_requires_data
      error = assert_raises(ArgumentError) do
        AudioContent.new(
          mime_type: @mime_type
        )
      end
      assert_match(/missing keyword: :?data/, error.message)
    end

    def test_initialize_requires_mime_type
      error = assert_raises(ArgumentError) do
        AudioContent.new(
          data: @data
        )
      end
      assert_match(/missing keyword: :?mime_type/, error.message)
    end

    def test_data_attribute_reader
      audio_content = AudioContent.new(data: @data, mime_type: @mime_type)
      assert_equal @data, audio_content.data
    end

    def test_mime_type_attribute_reader
      audio_content = AudioContent.new(mime_type: @mime_type, data: @data)
      assert_equal @mime_type, audio_content.mime_type
    end

    def test_annotations_attribute_reader
      audio_content = AudioContent.new(annotations: @annotations, data: @data, mime_type: @mime_type)
      assert_equal @annotations, audio_content.annotations
    end

  end
end
