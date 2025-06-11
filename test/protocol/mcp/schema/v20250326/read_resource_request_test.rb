# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ReadResourceRequestTest < Minitest::Test
      def setup
      @uri = "file:///test"
  end

  def test_initialize_with_all_params
    read_resource_request = ReadResourceRequest.new(
      uri: @uri
    )

    assert_equal @uri, read_resource_request.uri
  end

def test_initialize_requires_uri
  error = assert_raises(ArgumentError) do
    ReadResourceRequest.new(
      
    )
  end
  assert_match(/missing keyword: :?uri/, error.message)
end

def test_uri_attribute_reader
  read_resource_request = ReadResourceRequest.new(uri: @uri)
  assert_equal @uri, read_resource_request.uri
end

def test_inherits_from_request
  read_resource_request = ReadResourceRequest.new(uri: @uri)
  assert_kind_of Request, read_resource_request
end

  end
end
