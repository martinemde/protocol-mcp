# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class PaginatedRequestTest < Minitest::Test
    def setup
      @cursor = "page_cursor"
    end

    def test_initialize_with_all_params
      request = PaginatedRequest.new(
        cursor: @cursor
      )

      assert_nil request.params
    end

    def test_initialize_with_cursor_only
      request = PaginatedRequest.new(cursor: @cursor)

      assert_nil request.params
    end

    def test_initialize_with_no_params
      request = PaginatedRequest.new

      assert_nil request.params
    end

    def test_inherits_from_request
      request = PaginatedRequest.new
      assert_kind_of Request, request
    end
  end
end
