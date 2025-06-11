# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class RootsListChangedNotificationTest < Minitest::Test
    def test_initialize_with_no_params
  roots_list_changed_notification = RootsListChangedNotification.new

  assert_instance_of RootsListChangedNotification, roots_list_changed_notification
end

def test_inherits_from_notification
  roots_list_changed_notification = RootsListChangedNotification.new
  assert_kind_of Notification, roots_list_changed_notification
end

  end
end
