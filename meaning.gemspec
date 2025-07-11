# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meaning/version'

Gem::Specification.new do |spec|
  spec.name          = "meaning"
  spec.version       = Meaning::VERSION
  spec.authors       = ["Khaled0Fares"]
  spec.email         = ["kfares29@gmail.com"]

  spec.summary       = %q{English Dictionary(CLI and API) based on dictionary.cambridge.org}
  spec.description   = %q{English Dictionary(CLI and API) based on dictionary.cambridge.org site}
  spec.homepage      = "https://github.com/khaledmohammedfares/meaning"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ['meaning']
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.6.0'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_runtime_dependency "thor", "~> 1.0"
  spec.add_runtime_dependency "nokogiri", "~> 1.12"
  spec.add_runtime_dependency "rainbow", "~> 3.0"
end
