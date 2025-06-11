# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ListResourceTemplatesRequestTest < Minitest::Test
    def test_initialize_with_no_params
  list_resource_templates_request = ListResourceTemplatesRequest.new

  assert_instance_of ListResourceTemplatesRequest, list_resource_templates_request
end

def test_inherits_from_paginated_request
  list_resource_templates_request = ListResourceTemplatesRequest.new
  assert_kind_of PaginatedRequest, list_resource_templates_request
end

  end
end
