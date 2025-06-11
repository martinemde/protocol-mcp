# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class CreateMessageResultTest < Minitest::Test
      def setup
      @stop_reason = nil
      @model = "test_value"
  end

  def test_initialize_with_all_params
    create_message_result = CreateMessageResult.new(
      stop_reason: @stop_reason,
        model: @model
    )

    assert_equal @stop_reason, create_message_result.stop_reason
    assert_equal @model, create_message_result.model
  end

  def test_initialize_with_required_params_only
    create_message_result = CreateMessageResult.new(
      model: @model
    )

    assert_equal @model, create_message_result.model
    assert_nil create_message_result.stop_reason
  end

def test_initialize_requires_model
  error = assert_raises(ArgumentError) do
    CreateMessageResult.new(
      
    )
  end
  assert_match(/missing keyword: :?model/, error.message)
end

def test_model_attribute_reader
  create_message_result = CreateMessageResult.new(model: @model)
  assert_equal @model, create_message_result.model
end

def test_stop_reason_attribute_reader
  create_message_result = CreateMessageResult.new(stop_reason: @stop_reason, model: @model)
  assert_equal @stop_reason, create_message_result.stop_reason
end

def test_inherits_from_result
  create_message_result = CreateMessageResult.new(model: @model)
  assert_kind_of Result, create_message_result
end

  end
end
