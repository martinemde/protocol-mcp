require_relative 'schema_node'

module Schema
  class Generator
    class Interface < SchemaNode
      attr_reader :type_aliases, :members, :params_members

      def initialize(item, type_aliases: [], force_module: false)
        super(item)
        raise "Not an Interface: #{item.inspect}" unless kind == 'Interface'
        @type_aliases = type_aliases
        @force_module = force_module
        @members = Member.wrap(ast_structure[:members])
        @params_members = @members[:params]&.members || {}
      end

      def base_type = ast_structure[:extends]&.first
      def extends_base_type? = base_type && MODULES.include?(base_type)

      def generate
        super # add comments at top of file

        generate_interface_class
      end

      def generate_interface_class
        puts "generating interface class #{name}"

        generate_class(ruby_code, name, comment, extends: base_type) do |indented|
          generate_includes(indented)

          method_value = members[:method]&.literal

          # Split between Request/Notification classes and Normal classes
          if method_value
            generate_request_body(indented, method_value)
          else
            # Normal classes accept all their properties
            generate_normal_body(indented)
          end
        end
      end

      def generate_request_body(indented, method_value)
        # For classes with params properties, create an initialize method that accepts each property
        initialize_kwargs = []
        instance_vars = []
        params_hash = {}

        if params_members.empty?
          # For classes with no params properties, create a simple initialize method
          generate_method(indented, 'initialize', ["**params"]) do |indented2|
            indented2 << "super(method: \"#{method_value}\", params:)"
          end
          return
        end

        # Generate attr_reader for properties
        generate_attr_readers(indented, params_members)

        # Add comments and parameters for each property in params
        params_members.each do |name, prop|
          generate_param_comment(indented, prop)
          kwarg = prop.initialize_kwarg
          initialize_kwargs << kwarg if kwarg
          instance_vars << prop.initialize_assignment
          params_hash[prop.original_name] = prop.name
        end

        generate_method(indented, 'initialize', initialize_kwargs) do |indented2|
          # Add instance variable assignments for all params properties
          instance_vars.each { |var| indented2 << var }

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
          indented2 << "freeze"
        end
      end

      def generate_normal_body(indented)
        initialize_kwargs = []
        instance_vars = []
        super_params = []

        # Generate attr_reader for properties
        generate_attr_readers(indented, members)

        members.each do |name, prop|
          generate_param_comment(indented, prop)

          kwarg = prop.initialize_kwarg
          initialize_kwargs << kwarg if kwarg
          instance_vars << prop.initialize_assignment
        end

        # Get parameters to pass to super
        base_props = members.select { |name, _| !base_type || name.to_s == base_type.downcase }
        base_props.each do |_, prop|
          prop.members.each do |name, member|
            param_name = member.name
            super_params << "#{param_name}: #{param_name}"
          end
        end

        if base_type
          initialize_kwargs << "**kwargs"
          super_params << "**kwargs"
        end

        # Generate method
        generate_method(indented, 'initialize', initialize_kwargs) do |indented2|
          # Add instance variable assignments
          instance_vars.each { |var| indented2 << var }

          # Call super with appropriate parameters
          indented2 << "super(#{super_params.join(', ')})" if base_type
          indented2 << "freeze"
        end
      end

      def generate_class(ruby_code, name, comment, extends: nil, &block)
        parent = extends ? " < #{extends}" : ""
        generate_code_block(ruby_code, "class #{name}#{parent}", comment:, &block)
      end

      def generate_includes(indented)
        type_aliases.each do |type_alias|
          indented << "include #{type_alias}"
        end
        indented << ""
      end

      def generate_attr_readers(indented, props)
        props.each do |name, prop|
          generate_comment(indented, prop.comment_lines)
          indented << "attr_reader :#{name}"
          indented << ""
        end
      end
    end
  end
end
