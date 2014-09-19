# coding: utf-8

# Read version from project VERSION file.
require File.expand_path('lib/version', File.dirname(__FILE__))

# lib = File.expand_path('lib', File.dirname(__FILE__))
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'Learn'
  s.version       = Learn::VERSION
  s.authors       = ['Frank Jung']
  s.email         = ['frankhjung@linux.com']
  s.summary       = %q{Learn Ruby}
  s.description   = %q{A project to help me Learn Ruby.}
  s.homepage      = 'http://members.iinet.net.au/~frankjung/'
  s.license       = 'GPLv2'
  s.files         = ['lib/learn.rb']
  s.executables   = ['']
  s.test_files    = ['tests/test_learn.rb']
  s.require_paths = ['lib']
  s.platform      = Gem::Platform::RUBY
end
