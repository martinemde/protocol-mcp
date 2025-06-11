# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ListResourceTemplatesResultTest < Minitest::Test
      def setup
      @resource_templates = "test_value"
  end

  def test_initialize_with_all_params
    list_resource_templates_result = ListResourceTemplatesResult.new(
      resource_templates: @resource_templates
    )

    assert_equal @resource_templates, list_resource_templates_result.resource_templates
  end

def test_initialize_requires_resource_templates
  error = assert_raises(ArgumentError) do
    ListResourceTemplatesResult.new(
      
    )
  end
  assert_match(/missing keyword: :?resource_templates/, error.message)
end

def test_resource_templates_attribute_reader
  list_resource_templates_result = ListResourceTemplatesResult.new(resource_templates: @resource_templates)
  assert_equal @resource_templates, list_resource_templates_result.resource_templates
end

def test_inherits_from_paginated_result
  list_resource_templates_result = ListResourceTemplatesResult.new(resource_templates: @resource_templates)
  assert_kind_of PaginatedResult, list_resource_templates_result
end

  end
end
