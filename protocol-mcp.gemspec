# frozen_string_literal: true

require_relative "lib/protocol/mcp/version"

Gem::Specification.new do |spec|
  spec.name = "protocol-mcp"
  spec.version = Protocol::Mcp::VERSION
  spec.authors = ["Martin Emde"]
  spec.email = ["me@martinemde.com"]

  spec.summary = "Multi-schema Model Context Protocol (MCP) implementation"
  spec.description = "Multi-schema client and server Model Context Protocol (MCP) implementation. Implements the full MCP spec through transpilation of the MCP TypeScript definitions, making it easy to implement your server or client in Ruby."
  spec.homepage = "https://github.com/martinemde/protocol-mcp"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/martinemde/protocol-mcp"
  spec.metadata["changelog_uri"] = "https://github.com/martinemde/protocol-mcp/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile schema/generator .ruby-version .standard.yml Rakefile package.json package-lock.json schema/ ])
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "protocol-jsonrpc", "~> 0.2.1"
end
