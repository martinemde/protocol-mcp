# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ListPromptsResultTest < Minitest::Test
      def setup
      @prompts = [{ name: "test" }]
  end

  def test_initialize_with_all_params
    list_prompts_result = ListPromptsResult.new(
      prompts: @prompts
    )

    assert_equal @prompts, list_prompts_result.prompts
  end

def test_initialize_requires_prompts
  error = assert_raises(ArgumentError) do
    ListPromptsResult.new(
      
    )
  end
  assert_match(/missing keyword: :?prompts/, error.message)
end

def test_prompts_attribute_reader
  list_prompts_result = ListPromptsResult.new(prompts: @prompts)
  assert_equal @prompts, list_prompts_result.prompts
end

def test_inherits_from_paginated_result
  list_prompts_result = ListPromptsResult.new(prompts: @prompts)
  assert_kind_of PaginatedResult, list_prompts_result
end

  end
end
