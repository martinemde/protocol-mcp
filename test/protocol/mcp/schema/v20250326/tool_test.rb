# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ToolTest < Minitest::Test
    def setup
      @name = "test_tool"
      @description = "A test tool for testing"
      @input_schema = {
        type: "object",
        properties: { param: { type: "string" } },
        required: ["param"]
      }
      @annotations = { category: "test" }
    end

    def test_initialize_with_all_params
      tool = Tool.new(
        name: @name,
        description: @description,
        input_schema: @input_schema,
        annotations: @annotations
      )

      assert_equal @name, tool.name
      assert_equal @description, tool.description
      assert_equal @input_schema, tool.input_schema
      assert_equal @annotations, tool.annotations
    end

    def test_initialize_with_required_params_only
      tool = Tool.new(
        name: @name,
        input_schema: @input_schema
      )

      assert_equal @name, tool.name
      assert_nil tool.description
      assert_equal @input_schema, tool.input_schema
      assert_nil tool.annotations
    end

    def test_initialize_requires_name
      error = assert_raises(ArgumentError) do
        Tool.new(input_schema: @input_schema)
      end
      assert_match(/missing keyword: :?name/, error.message)
    end

    def test_initialize_requires_input_schema
      error = assert_raises(ArgumentError) do
        Tool.new(name: @name)
      end
      assert_match(/missing keyword: :?input_schema/, error.message)
    end
  end
end
