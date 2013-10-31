# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bundler/bower/version'

Gem::Specification.new do |spec|
  spec.name          = "bundler-bower"
  spec.version       = Bundler::Bower::VERSION
  spec.authors       = ["Piotr Niełacny"]
  spec.email         = ["piotr.nielacny@gmail.com"]
  spec.description   = %q{Write a gem description}
  spec.summary       = %q{integration bundler with bower}
  spec.homepage      = "https://github.com/LTe/bundler-bower"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bower-rails", "~> 0.5"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
