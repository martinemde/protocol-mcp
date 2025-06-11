# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ResourceListChangedNotificationTest < Minitest::Test
    def test_initialize_with_no_params
  resource_list_changed_notification = ResourceListChangedNotification.new

  assert_instance_of ResourceListChangedNotification, resource_list_changed_notification
end

def test_inherits_from_notification
  resource_list_changed_notification = ResourceListChangedNotification.new
  assert_kind_of Notification, resource_list_changed_notification
end

  end
end
