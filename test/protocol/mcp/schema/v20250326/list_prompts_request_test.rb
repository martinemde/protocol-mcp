# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ListPromptsRequestTest < Minitest::Test
    def test_initialize_with_no_params
  list_prompts_request = ListPromptsRequest.new

  assert_instance_of ListPromptsRequest, list_prompts_request
end

def test_inherits_from_paginated_request
  list_prompts_request = ListPromptsRequest.new
  assert_kind_of PaginatedRequest, list_prompts_request
end

  end
end
