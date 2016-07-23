# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'druzy/protocol/version'

Gem::Specification.new do |spec|
  spec.name          = "druzy-protocol"
  spec.version       = Druzy::Protocol::VERSION
  spec.authors       = ["Jonathan Le Greneur"]
  spec.email         = ["jonathan.legreneur@free.fr"]

  spec.summary       = %q{Protocols de découverte et controles de différents services}
  spec.description   = %q{Protocols de découverte et controles d l'UPnP, Chromecast et airplay}
  spec.homepage      = "https://github.com/druzy/ruby-druzy-protocol"
  spec.license       = "MIT"

  spec.files         = `find lib -type f`.split("\n")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "druzy-mvc", ">= 1.2.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
