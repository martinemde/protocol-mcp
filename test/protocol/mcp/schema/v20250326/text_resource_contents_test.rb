# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class TextResourceContentsTest < Minitest::Test
    def setup
      @text = "test_text"
      @uri = "test_uri"
      @mime_type = "test_mime_type"
    end

    def test_initialize_with_all_params
      text_resource_contents = TextResourceContents.new(
        text: @text,
        uri: @uri,
        mime_type: @mime_type
      )

      assert_equal @text, text_resource_contents.text
      assert_equal @uri, text_resource_contents.uri
      assert_equal @mime_type, text_resource_contents.mime_type
    end

    def test_initialize_requires_text
      error = assert_raises(ArgumentError) do
        TextResourceContents.new(
          uri: @uri,
          mime_type: @mime_type
        )
      end
      assert_match(/missing keyword: :?text/, error.message)
    end

    def test_initialize_requires_uri
      error = assert_raises(ArgumentError) do
        TextResourceContents.new(
          text: @text,
          mime_type: @mime_type
        )
      end
      assert_match(/missing keyword: :?uri/, error.message)
    end
  end
end
