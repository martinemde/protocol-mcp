# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ProgressNotificationTest < Minitest::Test
      def setup
      @total = nil
      @message = "test_message"
      @progress_token = "test_token"
      @progress = "test_value"
  end

  def test_initialize_with_all_params
    progress_notification = ProgressNotification.new(
      total: @total,
        message: @message,
        progress_token: @progress_token,
        progress: @progress
    )

    assert_equal @total, progress_notification.total
    assert_equal @message, progress_notification.message
    assert_equal @progress_token, progress_notification.progress_token
    assert_equal @progress, progress_notification.progress
  end

  def test_initialize_with_required_params_only
    progress_notification = ProgressNotification.new(
      progress_token: @progress_token,
        progress: @progress
    )

    assert_equal @progress_token, progress_notification.progress_token
    assert_equal @progress, progress_notification.progress
    assert_nil progress_notification.total
    assert_nil progress_notification.message
  end

def test_initialize_requires_progress_token
  error = assert_raises(ArgumentError) do
    ProgressNotification.new(
      progress: @progress
    )
  end
  assert_match(/missing keyword: :?progress_token/, error.message)
end

def test_initialize_requires_progress
  error = assert_raises(ArgumentError) do
    ProgressNotification.new(
      progress_token: @progress_token
    )
  end
  assert_match(/missing keyword: :?progress/, error.message)
end

def test_progress_token_attribute_reader
  progress_notification = ProgressNotification.new(progress_token: @progress_token, progress: @progress)
  assert_equal @progress_token, progress_notification.progress_token
end

def test_progress_attribute_reader
  progress_notification = ProgressNotification.new(progress: @progress, progress_token: @progress_token)
  assert_equal @progress, progress_notification.progress
end

def test_total_attribute_reader
  progress_notification = ProgressNotification.new(total: @total, progress_token: @progress_token, progress: @progress)
  assert_equal @total, progress_notification.total
end

def test_message_attribute_reader
  progress_notification = ProgressNotification.new(message: @message, progress_token: @progress_token, progress: @progress)
  assert_equal @message, progress_notification.message
end

def test_inherits_from_notification
  progress_notification = ProgressNotification.new(progress_token: @progress_token, progress: @progress)
  assert_kind_of Notification, progress_notification
end

  end
end
