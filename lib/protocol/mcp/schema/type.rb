#  frozen_string_literal: true

module Protocol::Mcp::Schema
  module Type
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def schema_attribute(name, optional: false)
        define_method(name) { attributes[name] }
        define_method("#{name}_optional?") { optional }
        define_method("#{name}_required?") { !optional }
      end

      def params_attribute(name, optional: false)
        define_method(name) { params[name] }
        define_method("#{name}_optional?") { optional }
        define_method("#{name}_required?") { !optional }
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
