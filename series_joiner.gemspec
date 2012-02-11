# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'series_joiner/version'

Gem::Specification.new do |s|
  s.name         = "series_joiner"
  s.version      = SeriesJoiner::VERSION
  s.authors      = ["Dan Gebhardt"]
  s.email        = "support@cerebris.com"
  s.homepage     = "https://github.com/cerebris/series_joiner"
  s.summary      = "Join items in arrays together into grammatically correct series."
  s.description  = "Extends Array with a join_as_series() method for joining arrays of items together into grammatically correct series. Useful for joining series like 'a, b and c'. Custom delimiters and conjunctions can be specified."

  s.files        = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files   = Dir["spec/**/*"]
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'

  s.add_development_dependency "rspec"
end
