# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ReadResourceResultTest < Minitest::Test
      def setup
      @contents = "test_value"
  end

  def test_initialize_with_all_params
    read_resource_result = ReadResourceResult.new(
      contents: @contents
    )

    assert_equal @contents, read_resource_result.contents
  end

def test_initialize_requires_contents
  error = assert_raises(ArgumentError) do
    ReadResourceResult.new(
      
    )
  end
  assert_match(/missing keyword: :?contents/, error.message)
end

def test_contents_attribute_reader
  read_resource_result = ReadResourceResult.new(contents: @contents)
  assert_equal @contents, read_resource_result.contents
end

def test_inherits_from_result
  read_resource_result = ReadResourceResult.new(contents: @contents)
  assert_kind_of Result, read_resource_result
end

  end
end
