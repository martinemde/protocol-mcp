#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'generate_schema'

# Example JSON schema for the Notification interface
example_json = [
  {
    "name": "Notification",
    "comment": "",
    "type": "any",
    "nodeText": "export interface Notification {\n  method: string;\n  params?: {\n    /**\n     * This parameter name is reserved by MCP to allow clients and servers to attach additional metadata to their notifications.\n     */\n    _meta?: { [key: string]: unknown };\n    [key: string]: unknown;\n  };\n}",
    "astStructure": {
      "kind": "Interface",
      "name": "Notification",
      "members": [
        {
          "name": "method",
          "type": "string",
          "optional": false,
          "comment": "",
          "typeNode": {
            "kind": "SimpleType",
            "text": "string"
          }
        },
        {
          "name": "params",
          "type": "{\n    /**\n     * This parameter name is reserved by MCP to allow clients and servers to attach additional metadata to their notifications.\n     */\n    _meta?: { [key: string]: unknown };\n    [key: string]: unknown;\n  }",
          "optional": true,
          "comment": "",
          "typeNode": {
            "kind": "TypeLiteral",
            "members": [
              {
                "name": "_meta",
                "type": "{ [key: string]: unknown }",
                "optional": true,
                "comment": "This parameter name is reserved by MCP to allow clients and servers to attach additional metadata to their notifications.",
                "typeNode": {
                  "kind": "TypeLiteral",
                  "members": []
                }
              }
            ]
          }
        }
      ]
    }
  }
]

# Create a temporary JSON file with the example schema
temp_json_file = 'temp_schema.json'
File.write(temp_json_file, example_json.to_json)

# Create output directory
output_dir = 'examples/generated'

# Generate Ruby code from the schema
generator = SchemaGenerator.new(temp_json_file, output_dir)
generator.generate

# Clean up the temporary file
File.delete(temp_json_file)

puts "Schema generation complete. Output directory: #{output_dir}"
puts "Generated files:"
Dir.glob("#{output_dir}/*.rb").each do |file|
  puts "  - #{file}"
  puts "  Contents:"
  puts File.read(file)
  puts ""
end
