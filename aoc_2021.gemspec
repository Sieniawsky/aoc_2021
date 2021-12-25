# frozen_string_literal: true

require_relative "lib/aoc_2021/version"

Gem::Specification.new do |spec|
  spec.name          = "aoc_2021"
  spec.version       = Aoc2021::VERSION
  spec.authors       = ["Martin Sieniawski"]
  spec.email         = ["martin.sieniawski@instacart.com"]

  spec.summary       = "Solutions to Advent of Code 2021"
  spec.homepage      = "https://github.com/Sieniawsky/aoc_2021"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Sieniawsky/aoc_2021"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.2"
end
