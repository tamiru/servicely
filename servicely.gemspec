# frozen_string_literal: true

require_relative "lib/servicely/version"

Gem::Specification.new do |spec|
  spec.name        = "servicely"
  spec.version     = Servicely::VERSION
  spec.authors     = ["Tamiru Hailu"]
  spec.email       = ["tamiruhailu@gmail.com"]

  spec.summary     = "A Rails generator that creates clean, structured Service Objects for Rails apps and engines."
  spec.description = "Servicely provides a simple, consistent Service Object generator for Ruby on Rails applications and Rails Engines. It helps developers create maintainable service classes with a clean structure, namespacing support, and engine-awareness. Servicely automates service file creation, enforces best practices, and keeps your application logic organized."

  spec.homepage    = "https://github.com/tamiruhailu/servicely"
  spec.license     = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tamiruhailu/servicely"
  spec.metadata["changelog_uri"]   = "https://github.com/tamiruhailu/servicely/blob/main/CHANGELOG.md"

  spec.files         = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
