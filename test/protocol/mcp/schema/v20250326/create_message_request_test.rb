# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class CreateMessageRequestTest < Minitest::Test
      def setup
      @model_preferences = nil
      @system_prompt = nil
      @include_context = nil
      @temperature = nil
      @stop_sequences = nil
      @metadata = nil
      @messages = "test_value"
      @max_tokens = "test_value"
  end

  def test_initialize_with_all_params
    create_message_request = CreateMessageRequest.new(
      model_preferences: @model_preferences,
        system_prompt: @system_prompt,
        include_context: @include_context,
        temperature: @temperature,
        stop_sequences: @stop_sequences,
        metadata: @metadata,
        messages: @messages,
        max_tokens: @max_tokens
    )

    assert_equal @model_preferences, create_message_request.model_preferences
    assert_equal @system_prompt, create_message_request.system_prompt
    assert_equal @include_context, create_message_request.include_context
    assert_equal @temperature, create_message_request.temperature
    assert_equal @stop_sequences, create_message_request.stop_sequences
    assert_equal @metadata, create_message_request.metadata
    assert_equal @messages, create_message_request.messages
    assert_equal @max_tokens, create_message_request.max_tokens
  end

  def test_initialize_with_required_params_only
    create_message_request = CreateMessageRequest.new(
      messages: @messages,
        max_tokens: @max_tokens
    )

    assert_equal @messages, create_message_request.messages
    assert_equal @max_tokens, create_message_request.max_tokens
    assert_nil create_message_request.model_preferences
    assert_nil create_message_request.system_prompt
    assert_nil create_message_request.include_context
    assert_nil create_message_request.temperature
    assert_nil create_message_request.stop_sequences
    assert_nil create_message_request.metadata
  end

def test_initialize_requires_messages
  error = assert_raises(ArgumentError) do
    CreateMessageRequest.new(
      max_tokens: @max_tokens
    )
  end
  assert_match(/missing keyword: :?messages/, error.message)
end

def test_initialize_requires_max_tokens
  error = assert_raises(ArgumentError) do
    CreateMessageRequest.new(
      messages: @messages
    )
  end
  assert_match(/missing keyword: :?max_tokens/, error.message)
end

def test_messages_attribute_reader
  create_message_request = CreateMessageRequest.new(messages: @messages, max_tokens: @max_tokens)
  assert_equal @messages, create_message_request.messages
end

def test_model_preferences_attribute_reader
  create_message_request = CreateMessageRequest.new(model_preferences: @model_preferences, messages: @messages, max_tokens: @max_tokens)
  assert_equal @model_preferences, create_message_request.model_preferences
end

def test_system_prompt_attribute_reader
  create_message_request = CreateMessageRequest.new(system_prompt: @system_prompt, messages: @messages, max_tokens: @max_tokens)
  assert_equal @system_prompt, create_message_request.system_prompt
end

def test_include_context_attribute_reader
  create_message_request = CreateMessageRequest.new(include_context: @include_context, messages: @messages, max_tokens: @max_tokens)
  assert_equal @include_context, create_message_request.include_context
end

def test_temperature_attribute_reader
  create_message_request = CreateMessageRequest.new(temperature: @temperature, messages: @messages, max_tokens: @max_tokens)
  assert_equal @temperature, create_message_request.temperature
end

def test_max_tokens_attribute_reader
  create_message_request = CreateMessageRequest.new(max_tokens: @max_tokens, messages: @messages)
  assert_equal @max_tokens, create_message_request.max_tokens
end

def test_stop_sequences_attribute_reader
  create_message_request = CreateMessageRequest.new(stop_sequences: @stop_sequences, messages: @messages, max_tokens: @max_tokens)
  assert_equal @stop_sequences, create_message_request.stop_sequences
end

def test_metadata_attribute_reader
  create_message_request = CreateMessageRequest.new(metadata: @metadata, messages: @messages, max_tokens: @max_tokens)
  assert_equal @metadata, create_message_request.metadata
end

def test_inherits_from_request
  create_message_request = CreateMessageRequest.new(messages: @messages, max_tokens: @max_tokens)
  assert_kind_of Request, create_message_request
end

  end
end
