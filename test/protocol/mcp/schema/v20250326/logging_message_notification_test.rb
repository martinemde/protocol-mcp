# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class LoggingMessageNotificationTest < Minitest::Test
      def setup
      @logger = nil
      @level = "info"
      @data = "test_data"
  end

  def test_initialize_with_all_params
    logging_message_notification = LoggingMessageNotification.new(
      logger: @logger,
        level: @level,
        data: @data
    )

    assert_equal @logger, logging_message_notification.logger
    assert_equal @level, logging_message_notification.level
    assert_equal @data, logging_message_notification.data
  end

  def test_initialize_with_required_params_only
    logging_message_notification = LoggingMessageNotification.new(
      level: @level,
        data: @data
    )

    assert_equal @level, logging_message_notification.level
    assert_equal @data, logging_message_notification.data
    assert_nil logging_message_notification.logger
  end

def test_initialize_requires_level
  error = assert_raises(ArgumentError) do
    LoggingMessageNotification.new(
      data: @data
    )
  end
  assert_match(/missing keyword: :?level/, error.message)
end

def test_initialize_requires_data
  error = assert_raises(ArgumentError) do
    LoggingMessageNotification.new(
      level: @level
    )
  end
  assert_match(/missing keyword: :?data/, error.message)
end

def test_level_attribute_reader
  logging_message_notification = LoggingMessageNotification.new(level: @level, data: @data)
  assert_equal @level, logging_message_notification.level
end

def test_logger_attribute_reader
  logging_message_notification = LoggingMessageNotification.new(logger: @logger, level: @level, data: @data)
  assert_equal @logger, logging_message_notification.logger
end

def test_data_attribute_reader
  logging_message_notification = LoggingMessageNotification.new(data: @data, level: @level)
  assert_equal @data, logging_message_notification.data
end

def test_inherits_from_notification
  logging_message_notification = LoggingMessageNotification.new(level: @level, data: @data)
  assert_kind_of Notification, logging_message_notification
end

  end
end
