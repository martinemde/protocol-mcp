# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ToolAnnotationsTest < Minitest::Test
    def setup
      @title = "test_title"
      @read_only_hint = true
      @destructive_hint = false
      @idempotent_hint = true
      @open_world_hint = false
    end

    def test_initialize_with_all_params
      tool_annotations = ToolAnnotations.new(
        title: @title,
        read_only_hint: @read_only_hint,
        destructive_hint: @destructive_hint,
        idempotent_hint: @idempotent_hint,
        open_world_hint: @open_world_hint
      )

      assert_equal @title, tool_annotations.title
      assert_equal @read_only_hint, tool_annotations.read_only_hint
      assert_equal @destructive_hint, tool_annotations.destructive_hint
      assert_equal @idempotent_hint, tool_annotations.idempotent_hint
      assert_equal @open_world_hint, tool_annotations.open_world_hint
    end

    def test_initialize_with_no_params
      tool_annotations = ToolAnnotations.new

      assert_nil tool_annotations.title
      assert_equal false, tool_annotations.read_only_hint
      assert_equal true, tool_annotations.destructive_hint
      assert_equal false, tool_annotations.idempotent_hint
      assert_equal true, tool_annotations.open_world_hint
    end

    def test_title_attribute_reader
      tool_annotations = ToolAnnotations.new(title: @title)
      assert_equal @title, tool_annotations.title
    end

    def test_read_only_hint_attribute_reader
      tool_annotations = ToolAnnotations.new(read_only_hint: @read_only_hint)
      assert_equal @read_only_hint, tool_annotations.read_only_hint
    end

    def test_destructive_hint_attribute_reader
      tool_annotations = ToolAnnotations.new(destructive_hint: @destructive_hint)
      assert_equal @destructive_hint, tool_annotations.destructive_hint
    end

    def test_idempotent_hint_attribute_reader
      tool_annotations = ToolAnnotations.new(idempotent_hint: @idempotent_hint)
      assert_equal @idempotent_hint, tool_annotations.idempotent_hint
    end

    def test_open_world_hint_attribute_reader
      tool_annotations = ToolAnnotations.new(open_world_hint: @open_world_hint)
      assert_equal @open_world_hint, tool_annotations.open_world_hint
    end
  end
end
