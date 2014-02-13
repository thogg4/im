# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'im/version'

Gem::Specification.new do |spec|
  spec.name          = "im"
  spec.version       = Im::VERSION
  spec.authors       = ["Tim Hogg"]
  spec.email         = ["thogg4@gmail.com"]
  spec.date        = '2014-02-11'
  spec.summary     = "Chat using iMessage on your terminal!"
  spec.description = "Tired of getting off your terminal screen to answer that dickheads friends of yours? You can curse them right on the terminal now!"
  spec.homepage    = 'https://github.com/thogg4/im'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   << 'im'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "rb-appscript"
end
