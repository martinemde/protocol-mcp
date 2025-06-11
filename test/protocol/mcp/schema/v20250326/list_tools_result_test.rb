# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ListToolsResultTest < Minitest::Test
    def setup
      @tools = [
        { name: "tool1", description: "First tool", input_schema: { type: "object" } },
        { name: "tool2", description: "Second tool", input_schema: { type: "object" } }
      ]
      @next_cursor = "next_page"
    end

    def test_initialize_with_all_params
      result = ListToolsResult.new(
        tools: @tools,
        next_cursor: @next_cursor
      )

      assert_equal @tools, result.tools
      assert_equal @next_cursor, result.next_cursor
      assert_equal({
        "tools" => @tools,
        "next_cursor" => @next_cursor
      }, result.as_json)
    end

    def test_initialize_with_required_params_only
      result = ListToolsResult.new(tools: @tools)

      assert_equal @tools, result.tools
      assert_nil result.next_cursor
    end

    def test_initialize_requires_tools
      error = assert_raises(ArgumentError) do
        ListToolsResult.new
      end
      assert_match(/missing keyword: :?tools/, error.message)
    end

    def test_tools_attribute_reader
      result = ListToolsResult.new(tools: @tools)
      assert_equal @tools, result.tools
    end

    def test_inherits_from_paginated_result
      result = ListToolsResult.new(tools: @tools)
      assert_kind_of PaginatedResult, result
    end
  end
end
