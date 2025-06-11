# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ToolListChangedNotificationTest < Minitest::Test
    def test_initialize_with_no_params
  tool_list_changed_notification = ToolListChangedNotification.new

  assert_instance_of ToolListChangedNotification, tool_list_changed_notification
end

def test_inherits_from_notification
  tool_list_changed_notification = ToolListChangedNotification.new
  assert_kind_of Notification, tool_list_changed_notification
end

  end
end
