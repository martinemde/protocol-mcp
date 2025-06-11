# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ResourceContentsTest < Minitest::Test
      def setup
      @mime_type = nil
      @uri = "file:///test"
  end

  def test_initialize_with_all_params
    resource_contents = ResourceContents.new(
      mime_type: @mime_type,
        uri: @uri
    )

    assert_equal @mime_type, resource_contents.mime_type
    assert_equal @uri, resource_contents.uri
  end

  def test_initialize_with_required_params_only
    resource_contents = ResourceContents.new(
      uri: @uri
    )

    assert_equal @uri, resource_contents.uri
    assert_nil resource_contents.mime_type
  end

def test_initialize_requires_uri
  error = assert_raises(ArgumentError) do
    ResourceContents.new(
      
    )
  end
  assert_match(/missing keyword: :?uri/, error.message)
end

def test_uri_attribute_reader
  resource_contents = ResourceContents.new(uri: @uri)
  assert_equal @uri, resource_contents.uri
end

def test_mime_type_attribute_reader
  resource_contents = ResourceContents.new(mime_type: @mime_type, uri: @uri)
  assert_equal @mime_type, resource_contents.mime_type
end

  end
end
