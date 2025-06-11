# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class PromptArgumentTest < Minitest::Test
      def setup
      @description = nil
      @required = nil
      @name = "test_name"
  end

  def test_initialize_with_all_params
    prompt_argument = PromptArgument.new(
      description: @description,
        required: @required,
        name: @name
    )

    assert_equal @description, prompt_argument.description
    assert_equal @required, prompt_argument.required
    assert_equal @name, prompt_argument.name
  end

  def test_initialize_with_required_params_only
    prompt_argument = PromptArgument.new(
      name: @name
    )

    assert_equal @name, prompt_argument.name
    assert_nil prompt_argument.description
    assert_nil prompt_argument.required
  end

def test_initialize_requires_name
  error = assert_raises(ArgumentError) do
    PromptArgument.new(
      
    )
  end
  assert_match(/missing keyword: :?name/, error.message)
end

def test_name_attribute_reader
  prompt_argument = PromptArgument.new(name: @name)
  assert_equal @name, prompt_argument.name
end

def test_description_attribute_reader
  prompt_argument = PromptArgument.new(description: @description, name: @name)
  assert_equal @description, prompt_argument.description
end

def test_required_attribute_reader
  prompt_argument = PromptArgument.new(required: @required, name: @name)
  assert_equal @required, prompt_argument.required
end

  end
end
