# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ResourceUpdatedNotificationTest < Minitest::Test
      def setup
      @uri = "file:///test"
  end

  def test_initialize_with_all_params
    resource_updated_notification = ResourceUpdatedNotification.new(
      uri: @uri
    )

    assert_equal @uri, resource_updated_notification.uri
  end

def test_initialize_requires_uri
  error = assert_raises(ArgumentError) do
    ResourceUpdatedNotification.new(
      
    )
  end
  assert_match(/missing keyword: :?uri/, error.message)
end

def test_uri_attribute_reader
  resource_updated_notification = ResourceUpdatedNotification.new(uri: @uri)
  assert_equal @uri, resource_updated_notification.uri
end

def test_inherits_from_notification
  resource_updated_notification = ResourceUpdatedNotification.new(uri: @uri)
  assert_kind_of Notification, resource_updated_notification
end

  end
end
