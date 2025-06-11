#  frozen_string_literal: true

module Protocol::Mcp::Schema
  module Type
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def schema_attribute(name, optional: false)
        key = snake_to_camel_case(name.to_s)
        define_method(name) { attributes[key] }
        define_method("#{name}_optional?") { optional }
        define_method("#{name}_required?") { !optional }
      end

      def params_attribute(name, optional: false)
        key = snake_to_camel_case(name.to_s)
        define_method(name) { params[key] }
        define_method("#{name}_optional?") { optional }
        define_method("#{name}_required?") { !optional }
      end

      private

      def snake_to_camel_case(str)
        str.split('_').map.with_index { |word, index|
          index == 0 ? word : word.capitalize
        }.join.to_sym
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
