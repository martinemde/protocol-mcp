#  frozen_string_literal: true

module Protocol::Mcp::Schema
  module Type
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def schema_attribute(name, type, required: false)
        define_method(name) { attributes[name] }
        define_method("#{name}_type") { type }
        define_method("#{name}_required?") { required }
      end
    end

    # Returns the attributes as a hash.
    # @return [Hash]
    def to_h
      attributes
    end

    # Returns the attributes as a JSON-compatible hash.
    # @return [Hash]
    def as_json
      attributes
    end
  end
end
