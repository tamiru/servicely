# frozen_string_literal: true

require_relative "lib/servicely/version"

Gem::Specification.new do |spec|
  spec.name          = "servicely"
  spec.version       = Servicely::VERSION
  spec.authors       = ["Tamiru Hailu"]
  spec.email         = ["tamiruhailu@gmail.com"]

  spec.summary       = "Clean service object generator for Rails 5+ & engines"
  spec.description   = "Generates namespaced service objects like app/services/users/create_service.rb with ApplicationService base class. Works perfectly in Rails apps and engines."

  spec.homepage      = "https://github.com/tamiru/servicely"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata = {
    "homepage_uri"      => spec.homepage,
    "source_code_uri"   => "#{spec.homepage}/tree/v#{spec.version}",
    "changelog_uri"     => "#{spec.homepage}/blob/main/CHANGELOG.md",
    "rubygems_mfa_required" => "true"
  }

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|\.git)/}) }
  end

  spec.require_paths = ["lib"]
  spec.add_dependency "rails", ">= 5.0.0"
end