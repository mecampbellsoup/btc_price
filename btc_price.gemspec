# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'btc_price/version'

Gem::Specification.new do |spec|
  spec.name          = "btc_price"
  spec.version       = BtcPrice::VERSION
  spec.authors       = ["Matt Campbell"]
  spec.email         = ["mecampbell25@gmail.com"]
  spec.summary       = %q{Gem for grabbing BTC price from CLI. Also send yourself email price alerts.}
  spec.description   = <<-DESC
Use this gem for BTC price discovery; you can also configure
email notifications at price levels of your choosing.
  DESC
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "memcached", "~> 1.8"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "mocha", "~> 1.1"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "minitest", "~> 5.3"
end
