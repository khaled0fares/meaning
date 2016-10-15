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
  spec.executables   = ['meaning'] #spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "thor","~> 0.19.1"
  spec.add_runtime_dependency "nokogiri","~> 1.6.7"
    spec.add_runtime_dependency "rainbow","~> 2.1.0"

end
