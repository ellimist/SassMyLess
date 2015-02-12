# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'SassMyLess/version'

Gem::Specification.new do |spec|
  spec.name          = "SassMyLess"
  spec.version       = SassMyLess::VERSION
  spec.authors       = ["Adrian Bordinc"]
  spec.email         = ["adrian.bordinc@gmail.com"]
  spec.summary       = %q{Convert a LESS folder to a Sass styles}
  spec.homepage      = "http://github.com/ellimist"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   << "sassmyless"
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
