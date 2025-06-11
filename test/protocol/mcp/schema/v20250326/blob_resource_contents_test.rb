# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class BlobResourceContentsTest < Minitest::Test
      def setup
      @blob = "test_value"
      @uri = "test_uri"
      @mime_type = "test_mime_type"
  end

  def test_initialize_with_all_params
    blob_resource_contents = BlobResourceContents.new(
      blob: @blob,
      uri: @uri,
      mime_type: @mime_type
    )

    assert_equal @blob, blob_resource_contents.blob
    assert_equal @uri, blob_resource_contents.uri
    assert_equal @mime_type, blob_resource_contents.mime_type
  end

def test_initialize_requires_blob
  error = assert_raises(ArgumentError) do
    BlobResourceContents.new(
      uri: @uri,
      mime_type: @mime_type
    )
  end
  assert_match(/missing keyword: :?blob/, error.message)
end

def test_initialize_requires_uri
  error = assert_raises(ArgumentError) do
    BlobResourceContents.new(
      blob: @blob,
      mime_type: @mime_type
    )
  end
  assert_match(/missing keyword: :?uri/, error.message)
end

def test_blob_attribute_reader
  blob_resource_contents = BlobResourceContents.new(blob: @blob, uri: @uri)
  assert_equal @blob, blob_resource_contents.blob
end

def test_inherits_from_resource_contents
  blob_resource_contents = BlobResourceContents.new(blob: @blob, uri: @uri)
  assert_kind_of ResourceContents, blob_resource_contents
end

  end
end
