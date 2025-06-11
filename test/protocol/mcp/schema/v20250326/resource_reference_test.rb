# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ResourceReferenceTest < Minitest::Test
      def setup
      @uri = "file:///test"
  end

  def test_initialize_with_all_params
    resource_reference = ResourceReference.new(
      uri: @uri
    )

    assert_equal @uri, resource_reference.uri
  end

def test_initialize_requires_uri
  error = assert_raises(ArgumentError) do
    ResourceReference.new(
      
    )
  end
  assert_match(/missing keyword: :?uri/, error.message)
end

def test_uri_attribute_reader
  resource_reference = ResourceReference.new(uri: @uri)
  assert_equal @uri, resource_reference.uri
end

  end
end
