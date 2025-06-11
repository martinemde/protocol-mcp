# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ListResourcesRequestTest < Minitest::Test
    def test_initialize_with_no_params
  list_resources_request = ListResourcesRequest.new

  assert_instance_of ListResourcesRequest, list_resources_request
end

def test_inherits_from_paginated_request
  list_resources_request = ListResourcesRequest.new
  assert_kind_of PaginatedRequest, list_resources_request
end

  end
end
