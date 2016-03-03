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
  spec.description   = %q{This is an English dictionary orgmand line tool wihch can be used as an API in your Rails app based on dictionary.cambrige.org site.}
  spec.homepage      = "https://github.com/khaledmohammedfares/meaning"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ['meaning'] #spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "thor", "~> 19.1"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "rainbow"

end
