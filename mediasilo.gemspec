# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mediasilo/version'

Gem::Specification.new do |spec|
  spec.name          = "mediasilo"
  spec.version       = Mediasilo::VERSION
  spec.authors       = ["Maxim Pechnikov"]
  spec.email         = ["parallel588@gmail.com"]
  spec.description   = %q{Mediasilo makes it easy to find, review, share, present and deliver media anywhere, from any device.}
  spec.summary       = %q{Ruby bindings for the MediaSilo API}
  spec.homepage      = "http://developer.mediasilo.com/"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency 'rspec', '~> 2.13.0'
  spec.add_development_dependency "vcr", "~> 2.4.0"
  spec.add_development_dependency "webmock", "~> 1.11.0"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency "weary", "~> 1.1.3"
  spec.add_dependency 'multi_xml', "~> 0.5.1"
  spec.add_dependency "mono_logger", "~> 1.0.1"

end
