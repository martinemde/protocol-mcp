# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class ImplementationTest < Minitest::Test
      def setup
      @name = "test_name"
      @version = "test_value"
  end

  def test_initialize_with_all_params
    implementation = Implementation.new(
      name: @name,
        version: @version
    )

    assert_equal @name, implementation.name
    assert_equal @version, implementation.version
  end

def test_initialize_requires_name
  error = assert_raises(ArgumentError) do
    Implementation.new(
      version: @version
    )
  end
  assert_match(/missing keyword: :?name/, error.message)
end

def test_initialize_requires_version
  error = assert_raises(ArgumentError) do
    Implementation.new(
      name: @name
    )
  end
  assert_match(/missing keyword: :?version/, error.message)
end

def test_name_attribute_reader
  implementation = Implementation.new(name: @name, version: @version)
  assert_equal @name, implementation.name
end

def test_version_attribute_reader
  implementation = Implementation.new(version: @version, name: @name)
  assert_equal @version, implementation.version
end

  end
end
