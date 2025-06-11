# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ListRootsRequestTest < Minitest::Test
    def test_initialize_with_no_params
  list_roots_request = ListRootsRequest.new

  assert_instance_of ListRootsRequest, list_roots_request
end

def test_inherits_from_request
  list_roots_request = ListRootsRequest.new
  assert_kind_of Request, list_roots_request
end

  end
end
