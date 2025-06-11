# frozen_string_literal: true

require "test_helper"

module Protocol::Mcp::Schema::V20250326
  class CompleteRequestTest < Minitest::Test
    def setup
      @ref = { type: "prompt", name: "test_prompt" }
      @argument = { name: "test_arg", value: "test_value" }
    end

    def test_initialize_with_valid_params
      request = CompleteRequest.new(
        ref: @ref,
        argument: @argument
      )

      assert_equal "completion/complete", request.method
      assert_equal @ref, request.ref
      assert_equal @argument, request.argument
      assert_equal(
        {
          ref: @ref,
          argument: @argument
        },
        request.params
      )
    end

    def test_initialize_requires_ref
      error = assert_raises(ArgumentError) do
        CompleteRequest.new(argument: @argument)
      end
      assert_match(/missing keyword: :?ref/, error.message)
    end

    def test_initialize_requires_argument
      error = assert_raises(ArgumentError) do
        CompleteRequest.new(ref: @ref)
      end
      assert_match(/missing keyword: :?argument/, error.message)
    end

    def test_ref_attribute_reader
      request = CompleteRequest.new(ref: @ref, argument: @argument)
      assert_equal @ref, request.ref
    end

    def test_argument_attribute_reader
      request = CompleteRequest.new(ref: @ref, argument: @argument)
      assert_equal @argument, request.argument
    end
  end
end
