# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class GetPromptResultTest < Minitest::Test
      def setup
      @description = nil
      @messages = "test_value"
  end

  def test_initialize_with_all_params
    get_prompt_result = GetPromptResult.new(
      description: @description,
        messages: @messages
    )

    assert_equal @description, get_prompt_result.description
    assert_equal @messages, get_prompt_result.messages
  end

  def test_initialize_with_required_params_only
    get_prompt_result = GetPromptResult.new(
      messages: @messages
    )

    assert_equal @messages, get_prompt_result.messages
    assert_nil get_prompt_result.description
  end

def test_initialize_requires_messages
  error = assert_raises(ArgumentError) do
    GetPromptResult.new(
      
    )
  end
  assert_match(/missing keyword: :?messages/, error.message)
end

def test_description_attribute_reader
  get_prompt_result = GetPromptResult.new(description: @description, messages: @messages)
  assert_equal @description, get_prompt_result.description
end

def test_messages_attribute_reader
  get_prompt_result = GetPromptResult.new(messages: @messages)
  assert_equal @messages, get_prompt_result.messages
end

def test_inherits_from_result
  get_prompt_result = GetPromptResult.new(messages: @messages)
  assert_kind_of Result, get_prompt_result
end

  end
end
