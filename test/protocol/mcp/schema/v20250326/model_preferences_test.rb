# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ModelPreferencesTest < Minitest::Test
    def setup
      @hints = [{ type: "test_hint" }]
      @cost_priority = 0.5
      @speed_priority = 0.3
      @intelligence_priority = 0.8
    end

    def test_initialize_with_all_params
      preferences = ModelPreferences.new(
        hints: @hints,
        cost_priority: @cost_priority,
        speed_priority: @speed_priority,
        intelligence_priority: @intelligence_priority
      )

      assert_equal @hints, preferences.hints
      assert_equal @cost_priority, preferences.cost_priority
      assert_equal @speed_priority, preferences.speed_priority
      assert_equal @intelligence_priority, preferences.intelligence_priority
    end

    def test_initialize_with_no_params
      preferences = ModelPreferences.new

      assert_nil preferences.hints
      assert_nil preferences.cost_priority
      assert_nil preferences.speed_priority
      assert_nil preferences.intelligence_priority
    end

    def test_initialize_with_partial_params
      preferences = ModelPreferences.new(
        cost_priority: @cost_priority,
        intelligence_priority: @intelligence_priority
      )

      assert_nil preferences.hints
      assert_equal @cost_priority, preferences.cost_priority
      assert_nil preferences.speed_priority
      assert_equal @intelligence_priority, preferences.intelligence_priority
    end

    def test_hints_attribute_reader
      preferences = ModelPreferences.new(hints: @hints)
      assert_equal @hints, preferences.hints
    end

    def test_cost_priority_attribute_reader
      preferences = ModelPreferences.new(cost_priority: @cost_priority)
      assert_equal @cost_priority, preferences.cost_priority
    end

    def test_speed_priority_attribute_reader
      preferences = ModelPreferences.new(speed_priority: @speed_priority)
      assert_equal @speed_priority, preferences.speed_priority
    end

    def test_intelligence_priority_attribute_reader
      preferences = ModelPreferences.new(intelligence_priority: @intelligence_priority)
      assert_equal @intelligence_priority, preferences.intelligence_priority
    end
  end
end
