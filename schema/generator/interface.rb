require_relative 'schema_node'

module Schema
  class Generator
    class Interface < SchemaNode
      attr_reader :type_aliases, :members, :params_members

      def initialize(item, type_aliases: [], force_module: false, module_scope:)
        super(item, module_scope:)
        raise "Not an Interface: #{item.inspect}" unless kind == 'Interface'
        @type_aliases = type_aliases
        @force_module = force_module
        @members = Member.wrap(ast_structure[:members])
        @params_members = @members[:params]&.members || {}
      end

      def base_type = ast_structure[:extends]&.first
      def is_base_module? = MODULES.include?(name)

      def generate
        # Skip JSONRPC classes entirely
        if name.start_with?('JSONRPC')
          @skipped = true
          return
        end

        super do |indented|
          generate_interface_class(indented)
        end
      end

      def generate_interface_class(indented)
        puts "generating interface class #{name}"

        # Base modules inherit from Protocol::Jsonrpc classes
        parent_class = if is_base_module?
          "Protocol::Jsonrpc::#{name}"
        else
          base_type
        end

        generate_class(indented, name, comment, extends: parent_class) do |indented2|
          generate_includes(indented2, parent_class)

          method_value = members[:method]&.literal

          if method_value
            indented2 << "METHOD = \"#{method_value}\""
            indented2 << ""
          end

          # Handle base modules differently
          if is_base_module?
            # just inherit from the base class
          elsif method_value
            generate_request_body(indented2, method_value)
          else
            # Normal classes accept all their properties
            generate_normal_body(indented2)
          end
        end
      end

      def generate_request_body(indented, method_value)
        # For classes with params properties, create an initialize method that accepts each property
        initialize_kwargs = []
        params_hash = {}

        if params_members.empty?
          # For classes with no params properties, create a simple initialize method
          generate_method(indented, 'initialize', ["**params"]) do |indented2|
            indented2 << "super(method: METHOD, params:)"
          end
          return
        end

        # Generate schema_attribute for properties
        generate_attr_readers(indented, params_members)

        # Add comments and parameters for each property in params
        params_members.each do |name, prop|
          generate_param_comment(indented, prop)
          kwarg = prop.initialize_kwarg
          initialize_kwargs << kwarg if kwarg
          params_hash[prop.original_name] = prop.name
        end

        generate_method(indented, 'initialize', initialize_kwargs) do |indented2|
          # Create a params hash from the individual properties
          if !params_hash.empty?
            generate_multiline_hash(indented2, 'params', params_hash)
          end

          # Call super with the method and params
          if method_value
            indented2 << "super(method: METHOD, params:)"
          else
            indented2 << "super(params:)"
          end
        end
      end

      def generate_normal_body(indented)
        initialize_kwargs = []

        # Generate schema_attribute for properties
        generate_attr_readers(indented, members)

        # Add attr_reader for attributes only for base classes (no inheritance)
        unless base_type
          indented << "attr_reader :attributes"
          indented << ""
        end

        members.each do |name, prop|
          generate_param_comment(indented, prop)

          kwarg = prop.initialize_kwarg
          initialize_kwargs << kwarg if kwarg
        end

        # Always accept **kwargs for [key: string]: unknown pattern
        initialize_kwargs << "**kwargs"

        # Generate method
        generate_method(indented, 'initialize', initialize_kwargs) do |indented2|
          # Generate literal type assignments first
          members.each do |name, prop|
            if prop.literal_type?
              indented2 << "#{name} = #{prop.literal.inspect}"
            end
          end

          # Store additional attributes only for base classes
          unless base_type
            # Merge named parameters and kwargs into @attributes
            if members.any?
              attribute_assignments = []
              members.each do |name, prop|
                attribute_assignments << "#{prop.original_name}: #{name}"
              end
              indented2 << "@attributes = { #{attribute_assignments.join(', ')} }.merge(kwargs)"
            else
              indented2 << "@attributes = kwargs"
            end
          end

          # Call super with all properties when there's inheritance
          if base_type
            super_params = []
            members.each do |name, prop|
              super_params << "#{name}: #{name}"
            end
            super_params << "**kwargs"
            indented2 << "super(#{super_params.join(', ')})"
          end
        end
      end

      def generate_class(ruby_code, name, comment, extends: nil, &block)
        parent = extends ? " < #{extends}" : ""
        generate_code_block(ruby_code, "class #{name}#{parent}", comment:, &block)
      end

      def generate_includes(indented, parent_class)
        # Always include the Type module for schema_attribute functionality
        indented << "include Protocol::Mcp::Schema::Type"

        type_aliases.each do |type_alias|
          indented << "include #{type_alias}"
        end
        indented << ""
      end

      def generate_attr_readers(indented, props)
        props.each do |name, prop|
          generate_comment(indented, prop.comment_lines)
          if prop.optional
            indented << "schema_attribute :#{name}, optional: true"
          else
            indented << "schema_attribute :#{name}"
          end
          indented << ""
        end
      end
    end
  end
end
