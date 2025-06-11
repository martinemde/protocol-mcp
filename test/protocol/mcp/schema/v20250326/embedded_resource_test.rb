# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class EmbeddedResourceTest < Minitest::Test
      def setup
      @annotations = nil
      @resource = "test_value"
  end

  def test_initialize_with_all_params
    embedded_resource = EmbeddedResource.new(
      annotations: @annotations,
        resource: @resource
    )

    assert_equal @annotations, embedded_resource.annotations
    assert_equal @resource, embedded_resource.resource
  end

  def test_initialize_with_required_params_only
    embedded_resource = EmbeddedResource.new(
      resource: @resource
    )

    assert_equal @resource, embedded_resource.resource
    assert_nil embedded_resource.annotations
  end

def test_initialize_requires_resource
  error = assert_raises(ArgumentError) do
    EmbeddedResource.new(
      
    )
  end
  assert_match(/missing keyword: :?resource/, error.message)
end

def test_resource_attribute_reader
  embedded_resource = EmbeddedResource.new(resource: @resource)
  assert_equal @resource, embedded_resource.resource
end

def test_annotations_attribute_reader
  embedded_resource = EmbeddedResource.new(annotations: @annotations, resource: @resource)
  assert_equal @annotations, embedded_resource.annotations
end

  end
end
