# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class PromptListChangedNotificationTest < Minitest::Test
    def test_initialize_with_no_params
  prompt_list_changed_notification = PromptListChangedNotification.new

  assert_instance_of PromptListChangedNotification, prompt_list_changed_notification
end

def test_inherits_from_notification
  prompt_list_changed_notification = PromptListChangedNotification.new
  assert_kind_of Notification, prompt_list_changed_notification
end

  end
end
