# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class CancelledNotificationTest < Minitest::Test
      def setup
      @reason = nil
      @request_id = 123
  end

  def test_initialize_with_all_params
    cancelled_notification = CancelledNotification.new(
      reason: @reason,
        request_id: @request_id
    )

    assert_equal @reason, cancelled_notification.reason
    assert_equal @request_id, cancelled_notification.request_id
  end

  def test_initialize_with_required_params_only
    cancelled_notification = CancelledNotification.new(
      request_id: @request_id
    )

    assert_equal @request_id, cancelled_notification.request_id
    assert_nil cancelled_notification.reason
  end

def test_initialize_requires_request_id
  error = assert_raises(ArgumentError) do
    CancelledNotification.new(
      
    )
  end
  assert_match(/missing keyword: :?request_id/, error.message)
end

def test_request_id_attribute_reader
  cancelled_notification = CancelledNotification.new(request_id: @request_id)
  assert_equal @request_id, cancelled_notification.request_id
end

def test_reason_attribute_reader
  cancelled_notification = CancelledNotification.new(reason: @reason, request_id: @request_id)
  assert_equal @reason, cancelled_notification.reason
end

def test_inherits_from_notification
  cancelled_notification = CancelledNotification.new(request_id: @request_id)
  assert_kind_of Notification, cancelled_notification
end

  end
end
