# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class GetPromptRequestTest < Minitest::Test
      def setup
      @arguments = { param: "value" }
      @name = "test_name"
  end

  def test_initialize_with_all_params
    get_prompt_request = GetPromptRequest.new(
      arguments: @arguments,
        name: @name
    )

    assert_equal @arguments, get_prompt_request.arguments
    assert_equal @name, get_prompt_request.name
  end

  def test_initialize_with_required_params_only
    get_prompt_request = GetPromptRequest.new(
      name: @name
    )

    assert_equal @name, get_prompt_request.name
    assert_nil get_prompt_request.arguments
  end

def test_initialize_requires_name
  error = assert_raises(ArgumentError) do
    GetPromptRequest.new(
      
    )
  end
  assert_match(/missing keyword: :?name/, error.message)
end

def test_name_attribute_reader
  get_prompt_request = GetPromptRequest.new(name: @name)
  assert_equal @name, get_prompt_request.name
end

def test_arguments_attribute_reader
  get_prompt_request = GetPromptRequest.new(arguments: @arguments, name: @name)
  assert_equal @arguments, get_prompt_request.arguments
end

def test_inherits_from_request
  get_prompt_request = GetPromptRequest.new(name: @name)
  assert_kind_of Request, get_prompt_request
end

  end
end
