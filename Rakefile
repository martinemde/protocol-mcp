# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"

Minitest::TestTask.create

require "standard/rake"

require_relative "schema/generator"

namespace :generate do
  desc "Generate Ruby types from TypeScript schema"
  task :schema, [:version] do |t, args|
    version = args[:version] || "2025-03-26"
    translated_schema_file = "schema/#{version}/output.json"
    output_dir = File.expand_path("lib/protocol/mcp/schema", __dir__)

    # Run the generator
    generator = Schema::Generator.new(
      json_file_path: translated_schema_file,
      output_dir:,
      version:,
      scope: "Protocol::Mcp::Schema"
    )

    # Clear the output directory
    generator.clean
    generator.generate

    puts "Generated #{version} types into #{output_dir}"
  end

  task :all do
    %w[2024-11-05 2025-03-26].each do |version|
      Rake::Task["generate:schema"].invoke(version)
    end
  end
end

task default: %i[test standard]
