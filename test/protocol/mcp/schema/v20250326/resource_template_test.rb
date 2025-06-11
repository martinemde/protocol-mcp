# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ResourceTemplateTest < Minitest::Test
      def setup
      @description = nil
      @mime_type = nil
      @annotations = nil
      @uri_template = "test_value"
      @name = "test_name"
  end

  def test_initialize_with_all_params
    resource_template = ResourceTemplate.new(
      description: @description,
        mime_type: @mime_type,
        annotations: @annotations,
        uri_template: @uri_template,
        name: @name
    )

    assert_equal @description, resource_template.description
    assert_equal @mime_type, resource_template.mime_type
    assert_equal @annotations, resource_template.annotations
    assert_equal @uri_template, resource_template.uri_template
    assert_equal @name, resource_template.name
  end

  def test_initialize_with_required_params_only
    resource_template = ResourceTemplate.new(
      uri_template: @uri_template,
        name: @name
    )

    assert_equal @uri_template, resource_template.uri_template
    assert_equal @name, resource_template.name
    assert_nil resource_template.description
    assert_nil resource_template.mime_type
    assert_nil resource_template.annotations
  end

def test_initialize_requires_uri_template
  error = assert_raises(ArgumentError) do
    ResourceTemplate.new(
      name: @name
    )
  end
  assert_match(/missing keyword: :?uri_template/, error.message)
end

def test_initialize_requires_name
  error = assert_raises(ArgumentError) do
    ResourceTemplate.new(
      uri_template: @uri_template
    )
  end
  assert_match(/missing keyword: :?name/, error.message)
end

def test_uri_template_attribute_reader
  resource_template = ResourceTemplate.new(uri_template: @uri_template, name: @name)
  assert_equal @uri_template, resource_template.uri_template
end

def test_name_attribute_reader
  resource_template = ResourceTemplate.new(name: @name, uri_template: @uri_template)
  assert_equal @name, resource_template.name
end

def test_description_attribute_reader
  resource_template = ResourceTemplate.new(description: @description, uri_template: @uri_template, name: @name)
  assert_equal @description, resource_template.description
end

def test_mime_type_attribute_reader
  resource_template = ResourceTemplate.new(mime_type: @mime_type, uri_template: @uri_template, name: @name)
  assert_equal @mime_type, resource_template.mime_type
end

def test_annotations_attribute_reader
  resource_template = ResourceTemplate.new(annotations: @annotations, uri_template: @uri_template, name: @name)
  assert_equal @annotations, resource_template.annotations
end

  end
end
