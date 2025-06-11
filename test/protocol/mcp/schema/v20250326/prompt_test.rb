# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class PromptTest < Minitest::Test
      def setup
      @description = nil
      @arguments = { param: "value" }
      @name = "test_name"
  end

  def test_initialize_with_all_params
    prompt = Prompt.new(
      description: @description,
        arguments: @arguments,
        name: @name
    )

    assert_equal @description, prompt.description
    assert_equal @arguments, prompt.arguments
    assert_equal @name, prompt.name
  end

  def test_initialize_with_required_params_only
    prompt = Prompt.new(
      name: @name
    )

    assert_equal @name, prompt.name
    assert_nil prompt.description
    assert_nil prompt.arguments
  end

def test_initialize_requires_name
  error = assert_raises(ArgumentError) do
    Prompt.new(
      
    )
  end
  assert_match(/missing keyword: :?name/, error.message)
end

def test_name_attribute_reader
  prompt = Prompt.new(name: @name)
  assert_equal @name, prompt.name
end

def test_description_attribute_reader
  prompt = Prompt.new(description: @description, name: @name)
  assert_equal @description, prompt.description
end

def test_arguments_attribute_reader
  prompt = Prompt.new(arguments: @arguments, name: @name)
  assert_equal @arguments, prompt.arguments
end

  end
end
