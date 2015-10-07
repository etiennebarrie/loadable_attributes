# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'loadable_attributes'

Gem::Specification.new do |spec|
  spec.name          = "loadable_attributes"
  spec.version       = LoadableAttributes::VERSION
  spec.authors       = ["Étienne Barrié"]
  spec.email         = ["etienne.barrie@gmail.com"]

  spec.summary       = "Remove boilerplate to ensure load is called before accessing an attribute."
  spec.description   = ""
  spec.homepage      = "https://github.com/etiennebarrie/loadable_attributes"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
