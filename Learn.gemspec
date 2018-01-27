# coding: utf-8
# frozen_string_literal: true

# needed for Learn::VERSION
require File.expand_path('lib/learn', File.dirname(__FILE__))

Gem::Specification.new do |s|
  s.name          = 'Learn'
  s.version       = Learn::VERSION
  s.authors       = ['Frank Jung']
  s.email         = ['frankhjung@linux.com']
  s.summary       = %q(Learn Ruby)
  s.description   = %q(A project to help learn Ruby.)
  s.homepage      = 'https://github.com/frankhjung'
  s.license       = 'GPLv2'
  s.files         = %x(git ls-files).split($/)
  s.test_files    = ['tests/test_learn.rb']
  s.require_paths = ['lib']
  s.platform      = Gem::Platform::RUBY
  s.add_dependency 'version', '>=1.1'
  s.add_development_dependency 'bundler', '~>1.16'
  s.add_development_dependency 'minitest', '~>5.11'
  s.add_development_dependency 'rake', '~>12.3'
  s.add_development_dependency 'rubocop', '~>0.52'
end
