# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ListRootsResultTest < Minitest::Test
      def setup
      @roots = [{ name: "test" }]
  end

  def test_initialize_with_all_params
    list_roots_result = ListRootsResult.new(
      roots: @roots
    )

    assert_equal @roots, list_roots_result.roots
  end

def test_initialize_requires_roots
  error = assert_raises(ArgumentError) do
    ListRootsResult.new(
      
    )
  end
  assert_match(/missing keyword: :?roots/, error.message)
end

def test_roots_attribute_reader
  list_roots_result = ListRootsResult.new(roots: @roots)
  assert_equal @roots, list_roots_result.roots
end

def test_inherits_from_result
  list_roots_result = ListRootsResult.new(roots: @roots)
  assert_kind_of Result, list_roots_result
end

  end
end
