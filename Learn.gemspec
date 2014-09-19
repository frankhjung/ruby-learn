# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'Learn'
  spec.version       = '0.1.0'
  spec.authors       = ['Frank Jung']
  spec.email         = ['frankhjung@linux.com']
  spec.summary       = %q{Learn Ruby}
  spec.description   = %q{A project to help me Learn Ruby.}
  spec.homepage      = 'http://members.iinet.net.au/~frankjung/'
  spec.license       = 'GPLv2'

  spec.files         = ['lib/Learn.rb']
  spec.executables   = ['']
  spec.test_files    = ['tests/test_Learn.rb']
  spec.require_paths = ['lib']
end
