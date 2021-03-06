# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xorcist/version'

Gem::Specification.new do |spec|
  spec.name          = "xorcist"
  spec.version       = Xorcist::VERSION
  spec.authors       = ["Faraz Yashar"]
  spec.email         = ["faraz.yashar@gmail.com"]

  spec.summary       = "Blazing-fast-cross-platform-monkey-patch-free string XOR"
  spec.description   = "Blazing-fast-cross-platform-monkey-patch-free string XOR. Yes, that means JRuby too."
  spec.homepage      = "https://github.com/fny/xorcist"
  spec.license       = "MIT"

  spec.require_paths = ['lib']

  files = %w[README.md] + Dir.glob('lib/**/*.rb')

  spec.platform = 'java'
  spec.files = files + Dir.glob('lib/**/*.java') + Dir.glob('lib/**/*.jar')

  spec.cert_chain  = ["certs/fny.pem"]
  spec.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'minitest', '~> 5.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rake-compiler', '~> 0.9.5'
end
