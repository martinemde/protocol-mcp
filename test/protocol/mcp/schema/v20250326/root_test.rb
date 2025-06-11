# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class RootTest < Minitest::Test
      def setup
      @name = "test_name"
      @uri = "file:///test"
  end

  def test_initialize_with_all_params
    root = Root.new(
      name: @name,
        uri: @uri
    )

    assert_equal @name, root.name
    assert_equal @uri, root.uri
  end

  def test_initialize_with_required_params_only
    root = Root.new(
      uri: @uri
    )

    assert_equal @uri, root.uri
    assert_nil root.name
  end

def test_initialize_requires_uri
  error = assert_raises(ArgumentError) do
    Root.new(
      
    )
  end
  assert_match(/missing keyword: :?uri/, error.message)
end

def test_uri_attribute_reader
  root = Root.new(uri: @uri)
  assert_equal @uri, root.uri
end

def test_name_attribute_reader
  root = Root.new(name: @name, uri: @uri)
  assert_equal @name, root.name
end

  end
end
