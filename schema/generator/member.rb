# frozen_string_literal: true

require_relative 'ruby_type'

module Schema
  class Generator
    # "astStructure": {
    #   "kind": "Interface",
    #   "name": "UnsubscribeRequest",
    #   "extends": [
    #     "Request"
    #   ],
    #   "members": [
    #     {
    #       "name": "method",
    #       "type": "\"resources/unsubscribe\"",
    #       "optional": false,
    #       "comment": "",
    #       "comment_tags": [],
    #       "typeNode": {
    #         "kind": "LiteralType",
    #         "literal": "\"resources/unsubscribe\""
    #       }
    #     },
    #     {
    #       "name": "params",
    #       "type": "{\n    /**\n     * The URI of the resource to unsubscribe from.\n     *\n     * @format uri\n     */\n    uri: string;\n  }",
    #       "optional": false,
    #       "comment": "",
    #       "comment_tags": [],
    #       "typeNode": {
    #         "kind": "TypeLiteral",
    #         "members": [
    #           {
    #             "name": "uri",
    #             "type": "string",
    #             "optional": false,
    #             "comment": "The URI of the resource to unsubscribe from.",
    #             "comment_tags": [
    #               {
    #                 "tag": "format",
    #                 "comment": "uri"
    #               }
    #             ],
    #             "typeNode": {
    #               "kind": "SimpleType",
    #               "text": "string"
    #             }
    #           }
    #         ]
    #       }
    #     }
    #   ]
    # }
    Member = Data.define(:name, :original_name, :type, :optional, :comment_lines, :comment_tags, :type_node, :default) do
      def members
        type_node && type_node[:members] ? Member.wrap(type_node[:members]) : {}
      end

      def literal
        type_node[:literal]&.gsub('"', '') if type_node
      end

      def literal_type?
        type_node && type_node[:kind] == 'LiteralType'
      end

      def initialize_kwarg
        return nil if literal_type?
        optional ? "#{name}: #{default}" : "#{name}:"
      end

      def initialize_assignment
        if literal_type?
          "@#{name} = #{literal.inspect}"
        else
          "@#{name} = #{name}"
        end
      end
    end

    module MemberFactory
      def wrap(members)
        return {} unless members

        members.to_h do |member|
          m = load(member)
          [m.name.to_sym, m]
        end
      end

      def load(member)
        if member[:name].start_with?('[')
          # TODO: this is like a **kwargs member
          nil
        else
          original_name = member[:name]
          name = camel_to_snake_case(original_name)
          comment_tags = member[:comment_tags].to_h { |tag| tag.values_at(:tag, :comment) } if member[:comment_tags]
          comment_lines, default = extract_default(member[:comment] || '')

          Member.new(
            name: name,
            original_name: original_name,
            type: RubyType.from(type: member[:type], type_node: member[:typeNode]),
            optional: member[:optional] || false,
            comment_lines: comment_lines,
            comment_tags: comment_tags || {},
            type_node: member[:typeNode],
            default: default
          )
        end
      end

      # Convert camelCase to snake_case and handle special cases
      def camel_to_snake_case(str)
        str.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
      end

      # Always return a default value, using 'nil' if no default is found
      # You must use the optional keyword to determine if the default should be used
      def extract_default(comment_text)
        comment_lines = comment_text.lines(chomp: true)
        default_line = comment_lines.find { |line| line.start_with?('Default:') }

        if default_line
          default = comment_lines.delete(default_line).delete_prefix('Default: ').strip
          [comment_lines, default]
        else
          [comment_lines, 'nil']
        end
      end
    end

    Member.extend(MemberFactory)
  end
end
