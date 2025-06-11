# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ResultTest < Minitest::Test
      def setup
      @_meta = nil
  end

  def test_initialize_with_all_params
    result = Result.new(
      _meta: @_meta
    )

    assert_equal @_meta, result._meta
  end

def test__meta_attribute_reader
  result = Result.new(_meta: @_meta)
  assert_equal @_meta, result._meta
end

  end
end
