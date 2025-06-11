# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class AnnotationsTest < Minitest::Test
    def setup
      @audience = nil
      @priority = 0.5
    end

    def test_initialize_with_all_params
      annotations = Annotations.new(
        audience: @audience,
        priority: @priority
      )

      assert_equal @audience, annotations.audience
      assert_equal @priority, annotations.priority
    end
  end
end
