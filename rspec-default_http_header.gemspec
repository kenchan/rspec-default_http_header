# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/default_http_header/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-default_http_header"
  spec.version       = RSpec::DefaultHttpHeader::VERSION
  spec.authors       = ["Kenichi TAKAHASHI"]
  spec.email         = ["kenichi.taka@gmail.com"]
  spec.summary       = %q{Set default http headers in request specs}
  spec.description   = %q{}
  spec.homepage      = "http://github.com/kenchan/rspec-default_http_header"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec-rails", "> 3.0"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
