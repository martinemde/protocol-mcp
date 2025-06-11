# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class PromptReferenceTest < Minitest::Test
      def setup
      @name = "test_name"
  end

  def test_initialize_with_all_params
    prompt_reference = PromptReference.new(
      name: @name
    )

    assert_equal @name, prompt_reference.name
  end

def test_initialize_requires_name
  error = assert_raises(ArgumentError) do
    PromptReference.new(
      
    )
  end
  assert_match(/missing keyword: :?name/, error.message)
end

def test_name_attribute_reader
  prompt_reference = PromptReference.new(name: @name)
  assert_equal @name, prompt_reference.name
end

  end
end
