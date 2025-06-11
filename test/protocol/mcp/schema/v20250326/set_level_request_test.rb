# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class SetLevelRequestTest < Minitest::Test
      def setup
      @level = "info"
  end

  def test_initialize_with_all_params
    set_level_request = SetLevelRequest.new(
      level: @level
    )

    assert_equal @level, set_level_request.level
  end

def test_initialize_requires_level
  error = assert_raises(ArgumentError) do
    SetLevelRequest.new(
      
    )
  end
  assert_match(/missing keyword: :?level/, error.message)
end

def test_level_attribute_reader
  set_level_request = SetLevelRequest.new(level: @level)
  assert_equal @level, set_level_request.level
end

def test_inherits_from_request
  set_level_request = SetLevelRequest.new(level: @level)
  assert_kind_of Request, set_level_request
end

  end
end
