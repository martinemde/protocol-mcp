# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class InitializedNotificationTest < Minitest::Test
    def test_initialize_with_no_params
  initialized_notification = InitializedNotification.new

  assert_instance_of InitializedNotification, initialized_notification
end

def test_inherits_from_notification
  initialized_notification = InitializedNotification.new
  assert_kind_of Notification, initialized_notification
end

  end
end
