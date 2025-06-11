# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20241105
  class CreateMessageRequestTest < Minitest::Test
    def setup
      @messages = [{ role: "user", content: "Hello" }]
      @max_tokens = 100
      @model_preferences = { model: "gpt-4" }
      @system_prompt = "You are a helpful assistant"
      @include_context = "thisServer"
      @temperature = 0.7
      @stop_sequences = ["\n\n"]
      @metadata = { provider: "openai" }
    end

    def test_initialize_with_required_params
      request = CreateMessageRequest.new(
        messages: @messages,
        max_tokens: @max_tokens
      )

      assert_equal "sampling/createMessage", request.method
      assert_equal @messages, request.messages
      assert_equal @max_tokens, request.max_tokens
      assert_nil request.model_preferences
      assert_nil request.system_prompt
      assert_nil request.include_context
      assert_nil request.temperature
      assert_nil request.stop_sequences
      assert_nil request.metadata
    end

    def test_initialize_with_all_params
      request = CreateMessageRequest.new(
        messages: @messages,
        max_tokens: @max_tokens,
        model_preferences: @model_preferences,
        system_prompt: @system_prompt,
        include_context: @include_context,
        temperature: @temperature,
        stop_sequences: @stop_sequences,
        metadata: @metadata
      )

      assert_equal "sampling/createMessage", request.method
      assert_equal @messages, request.messages
      assert_equal @max_tokens, request.max_tokens
      assert_equal @model_preferences, request.model_preferences
      assert_equal @system_prompt, request.system_prompt
      assert_equal @include_context, request.include_context
      assert_equal @temperature, request.temperature
      assert_equal @stop_sequences, request.stop_sequences
      assert_equal @metadata, request.metadata
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

    def test_params_include_all_values
      request = CreateMessageRequest.new(
        messages: @messages,
        max_tokens: @max_tokens,
        model_preferences: @model_preferences,
        system_prompt: @system_prompt,
        include_context: @include_context,
        temperature: @temperature,
        stop_sequences: @stop_sequences,
        metadata: @metadata
      )

      expected_params = {
        messages: @messages,
        modelPreferences: @model_preferences,
        systemPrompt: @system_prompt,
        includeContext: @include_context,
        temperature: @temperature,
        maxTokens: @max_tokens,
        stopSequences: @stop_sequences,
        metadata: @metadata
      }

      assert_equal expected_params, request.params
    end
  end
end
