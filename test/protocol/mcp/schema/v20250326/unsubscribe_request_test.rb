# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class UnsubscribeRequestTest < Minitest::Test
      def setup
      @uri = "file:///test"
  end

  def test_initialize_with_all_params
    unsubscribe_request = UnsubscribeRequest.new(
      uri: @uri
    )

    assert_equal @uri, unsubscribe_request.uri
  end

def test_initialize_requires_uri
  error = assert_raises(ArgumentError) do
    UnsubscribeRequest.new(
      
    )
  end
  assert_match(/missing keyword: :?uri/, error.message)
end

def test_uri_attribute_reader
  unsubscribe_request = UnsubscribeRequest.new(uri: @uri)
  assert_equal @uri, unsubscribe_request.uri
end

def test_inherits_from_request
  unsubscribe_request = UnsubscribeRequest.new(uri: @uri)
  assert_kind_of Request, unsubscribe_request
end

  end
end
