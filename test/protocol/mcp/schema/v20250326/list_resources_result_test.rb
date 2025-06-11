# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ListResourcesResultTest < Minitest::Test
      def setup
      @resources = [{ name: "test" }]
  end

  def test_initialize_with_all_params
    list_resources_result = ListResourcesResult.new(
      resources: @resources
    )

    assert_equal @resources, list_resources_result.resources
  end

def test_initialize_requires_resources
  error = assert_raises(ArgumentError) do
    ListResourcesResult.new(
      
    )
  end
  assert_match(/missing keyword: :?resources/, error.message)
end

def test_resources_attribute_reader
  list_resources_result = ListResourcesResult.new(resources: @resources)
  assert_equal @resources, list_resources_result.resources
end

def test_inherits_from_paginated_result
  list_resources_result = ListResourcesResult.new(resources: @resources)
  assert_kind_of PaginatedResult, list_resources_result
end

  end
end
