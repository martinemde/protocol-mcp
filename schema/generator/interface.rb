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
      def extends_base_type? = base_type && MODULES.include?(base_type)

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

        generate_class(indented, name, comment, extends: base_type) do |indented2|
          generate_includes(indented2, base_type)

          method_value = members[:method]&.literal

          # Split between Request/Notification classes and Normal classes
          if method_value
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
            indented2 << "super(method: \"#{method_value}\", params:)"
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
            indented2 << "super(method: \"#{method_value}\", params:)"
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

      def generate_includes(indented, base_type)
        # Include the Type module for schema_attribute functionality
        unless base_type
          indented << "include Protocol::Mcp::Schema::Type"
        end

        type_aliases.each do |type_alias|
          indented << "include #{type_alias}"
        end
        indented << ""
      end

      def generate_attr_readers(indented, props)
        props.each do |name, prop|
          generate_comment(indented, prop.comment_lines)
          indented << "schema_attribute :#{name}"
          indented << ""
        end
      end
    end
  end
end
