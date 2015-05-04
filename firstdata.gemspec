# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'firstdata/version'

Gem::Specification.new do |spec|
  spec.name          = "firstdata"
  spec.version       = Firstdata::VERSION
  spec.authors       = ["Nitesh Gupta"]
  spec.email         = ["niteshvgupta@gmail.com"]
  spec.summary       = %q{Gem to wrap First Data's GGE4 API}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"

end
