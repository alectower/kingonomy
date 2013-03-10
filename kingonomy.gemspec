# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kingonomy/version'

Gem::Specification.new do |gem|
  gem.name          = "kingonomy"
  gem.version       = Kingonomy::VERSION
  gem.authors       = ["Alec Tower"]
  gem.email         = ["alectower@gmail.com"]
  gem.description   = %q{DSL for TradeKing API}
  gem.summary       = %q{DSL for TradeKing API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'oauth'
  gem.add_dependency 'json'
  gem.add_dependency 'capybara'
  gem.add_dependency 'ruport'
  gem.add_dependency 'capybara-webkit'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'rspec'
end
