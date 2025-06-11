# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class PaginatedResultTest < Minitest::Test
    def setup
      @next_cursor = "next_page_token"
    end

    def test_initialize_with_all_params
      result = PaginatedResult.new(next_cursor: @next_cursor)

      assert_equal @next_cursor, result.next_cursor
    end

    def test_initialize_with_no_params
      result = PaginatedResult.new

      assert_nil result.next_cursor
    end

    def test_next_cursor_attribute_reader
      result = PaginatedResult.new(next_cursor: @next_cursor)
      assert_equal @next_cursor, result.next_cursor
    end

    def test_inherits_from_result
      result = PaginatedResult.new
      assert_kind_of Result, result
    end
  end
end
