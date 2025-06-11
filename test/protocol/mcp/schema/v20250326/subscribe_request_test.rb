# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class SubscribeRequestTest < Minitest::Test
      def setup
      @uri = "file:///test"
  end

  def test_initialize_with_all_params
    subscribe_request = SubscribeRequest.new(
      uri: @uri
    )

    assert_equal @uri, subscribe_request.uri
  end

def test_initialize_requires_uri
  error = assert_raises(ArgumentError) do
    SubscribeRequest.new(
      
    )
  end
  assert_match(/missing keyword: :?uri/, error.message)
end

def test_uri_attribute_reader
  subscribe_request = SubscribeRequest.new(uri: @uri)
  assert_equal @uri, subscribe_request.uri
end

def test_inherits_from_request
  subscribe_request = SubscribeRequest.new(uri: @uri)
  assert_kind_of Request, subscribe_request
end

  end
end
