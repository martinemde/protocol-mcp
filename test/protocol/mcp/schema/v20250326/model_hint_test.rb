# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ModelHintTest < Minitest::Test
      def setup
      @name = "test_name"
  end

  def test_initialize_with_all_params
    model_hint = ModelHint.new(
      name: @name
    )

    assert_equal @name, model_hint.name
  end

def test_name_attribute_reader
  model_hint = ModelHint.new(name: @name)
  assert_equal @name, model_hint.name
end

  end
end
