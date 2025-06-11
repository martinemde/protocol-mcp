# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class NotificationTest < Minitest::Test
      def setup
      @params = { test: "value" }
      @method = "test_method"
  end

  def test_initialize_with_all_params
    notification = Notification.new(
      params: @params,
        method: @method
    )

    assert_equal @params, notification.params
    assert_equal @method, notification.method
  end

  def test_initialize_with_required_params_only
    notification = Notification.new(
      method: @method
    )

    assert_equal @method, notification.method
    assert_nil notification.params
  end

def test_initialize_requires_method
  error = assert_raises(ArgumentError) do
    Notification.new(
      
    )
  end
  assert_match(/missing keyword: :?method/, error.message)
end

def test_method_attribute_reader
  notification = Notification.new(method: @method)
  assert_equal @method, notification.method
end

def test_params_attribute_reader
  notification = Notification.new(params: @params, method: @method)
  assert_equal @params, notification.params
end

  end
end
