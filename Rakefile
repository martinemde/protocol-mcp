# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"

Minitest::TestTask.create

require "standard/rake"

require_relative "schema/generator"

namespace :generate do
  def generate_schema(version = "2025-03-26")
    translated_schema_file = "schema/#{version}/output.json"
    lib_root = "lib"
    output_dir = File.join(lib_root, "protocol/mcp/schema")

    # Run the generator
    generator = Schema::Generator.new(
      json_file_path: translated_schema_file,
      output_dir:,
      lib_root:,
      version:,
      scope: "Protocol::Mcp::Schema",
    )

    # Clear the output directory
    generator.clean
    generator.generate

    puts "Generated #{version} types into #{output_dir}"
  end

  namespace :schema do
    desc "Generate Ruby types from MCP Schema 2024-11-05"
    task :v20241105 do
      generate_schema("2024-11-05")
    end

    desc "Generate Ruby types from MCP Schema 2025-03-26"
    task :v20250326 do
      generate_schema("2025-03-26")
    end
  end

  task all: %w[schema:v20241105 schema:v20250326]
end

task default: %i[test standard]
