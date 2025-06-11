# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ListToolsRequestTest < Minitest::Test
    def test_initialize_with_no_params
      request = ListToolsRequest.new

      assert_equal "tools/list", request.method
      assert_nil request.params
    end

    def test_initialize_with_pagination_params
      pagination_params = { cursor: "next_page" }
      request = ListToolsRequest.new(**pagination_params)

      assert_equal "tools/list", request.method
      assert_nil request.params
    end

    def test_method_is_tools_list
      request = ListToolsRequest.new
      assert_equal "tools/list", request.method
    end

    def test_inherits_from_paginated_request
      request = ListToolsRequest.new
      assert_kind_of PaginatedRequest, request
    end
  end
end
