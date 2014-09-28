require File.expand_path('lib/version', File.dirname(__FILE__))

# http://ruby-doc.com/docs/ProgrammingRuby/
# lib = File.expand_path('lib', File.dirname(__FILE__))
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'Learn'
  spec.version       = Learn::VERSION
  spec.authors       = ['Frank Jung']
  spec.email         = ['frankhjung@linux.com']
  spec.summary       = %q{Learn Ruby}
  spec.description   = %q{A project to help learn Ruby.}
  spec.homepage      = 'https://github.com/frankhjung'
  spec.license       = 'GPLv2'
  spec.files         = %x(git ls-files).split($/)
  spec.executables   = ['']
  spec.test_files    = ['tests/test_learn.rb']
  spec.require_paths = ['lib']
  spec.platform      = Gem::Platform::RUBY

  spec.add_dependency 'version', '>=1.0'

  spec.add_development_dependency 'bundler', '~>1.7'
  spec.add_development_dependency 'minitest', '~>5.4'
  spec.add_development_dependency 'rake', '~>10.3'
  spec.add_development_dependency 'rubocop', '~>0.26'
end
