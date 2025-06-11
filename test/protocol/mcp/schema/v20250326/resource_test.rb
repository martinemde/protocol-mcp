# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ResourceTest < Minitest::Test
      def setup
      @description = nil
      @mime_type = nil
      @annotations = nil
      @uri = "file:///test"
      @name = "test_name"
  end

  def test_initialize_with_all_params
    resource = Resource.new(
      description: @description,
        mime_type: @mime_type,
        annotations: @annotations,
        uri: @uri,
        name: @name
    )

    assert_equal @description, resource.description
    assert_equal @mime_type, resource.mime_type
    assert_equal @annotations, resource.annotations
    assert_equal @uri, resource.uri
    assert_equal @name, resource.name
  end

  def test_initialize_with_required_params_only
    resource = Resource.new(
      uri: @uri,
        name: @name
    )

    assert_equal @uri, resource.uri
    assert_equal @name, resource.name
    assert_nil resource.description
    assert_nil resource.mime_type
    assert_nil resource.annotations
  end

def test_initialize_requires_uri
  error = assert_raises(ArgumentError) do
    Resource.new(
      name: @name
    )
  end
  assert_match(/missing keyword: :?uri/, error.message)
end

def test_initialize_requires_name
  error = assert_raises(ArgumentError) do
    Resource.new(
      uri: @uri
    )
  end
  assert_match(/missing keyword: :?name/, error.message)
end

def test_uri_attribute_reader
  resource = Resource.new(uri: @uri, name: @name)
  assert_equal @uri, resource.uri
end

def test_name_attribute_reader
  resource = Resource.new(name: @name, uri: @uri)
  assert_equal @name, resource.name
end

def test_description_attribute_reader
  resource = Resource.new(description: @description, uri: @uri, name: @name)
  assert_equal @description, resource.description
end

def test_mime_type_attribute_reader
  resource = Resource.new(mime_type: @mime_type, uri: @uri, name: @name)
  assert_equal @mime_type, resource.mime_type
end

def test_annotations_attribute_reader
  resource = Resource.new(annotations: @annotations, uri: @uri, name: @name)
  assert_equal @annotations, resource.annotations
end

  end
end
