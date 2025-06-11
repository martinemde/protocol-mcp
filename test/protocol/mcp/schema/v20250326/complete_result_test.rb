# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class CompleteResultTest < Minitest::Test
      def setup
      @completion = "test_value"
  end

  def test_initialize_with_all_params
    complete_result = CompleteResult.new(
      completion: @completion
    )

    assert_equal @completion, complete_result.completion
  end

def test_initialize_requires_completion
  error = assert_raises(ArgumentError) do
    CompleteResult.new(
      
    )
  end
  assert_match(/missing keyword: :?completion/, error.message)
end

def test_completion_attribute_reader
  complete_result = CompleteResult.new(completion: @completion)
  assert_equal @completion, complete_result.completion
end

def test_inherits_from_result
  complete_result = CompleteResult.new(completion: @completion)
  assert_kind_of Result, complete_result
end

  end
end
