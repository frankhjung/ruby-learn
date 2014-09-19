#!/usr/bin/rake

=begin

Ruby make file for Learn project.

==References

* http://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing
* http://en.wikipedia.org/wiki/Rake_(software)
* https://rubygems.org/gems/rake
* http://www.ruby-doc.org/core-1.9.3/doc/rake/rakefile_rdoc.html
* http://pastie.org/242691
=end

require 'rake/clean'
require 'bundler/gem_tasks'
require 'rake/version_task'
require File.expand_path('lib/version', File.dirname(__FILE__))

task :default => :test
task :all => [:clean, :clobber, :build, :test, :doc]

tests = FileList.new('tests/test_*.rb')
srcs = FileList.new('lib/*.rb', tests)
Rake::VersionTask.new

desc 'Show help'
task :help do
  puts "Show help.\nFor Rakefile help call:\n\trake -D\n"
  puts "Can we generate an array of Ruby scripts automatically?"
end

desc 'Update Gem bundles'
task :update do
  system 'bundle check'
  system 'bundle install'
  system 'bundle update'
  system 'bundle list'
  system 'gem list --local'
end

desc 'Check syntax'
task :check do
  system 'bundle check'
  ruby "-c -w #{srcs}"
  system "rubocop #{srcs}"
end

desc 'Run unit tests'
task :test => [:check] do
  ruby "#{tests}"
end

desc 'Document project'
task :doc do
  system "rdoc --all --op=doc --tab-width=4 Gemfile Learn.gemspec Rakefile VERSION #{srcs}"
end

spec = Gem::Specification.new do |s|
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
end

Rake::VersionTask.new do |task|
  task.with_git_tag = true
  task.with_gemspec = spec
end

CLEAN.include('**/*.bak', '**/*~')
CLOBBER.include('doc/', 'pkg/')
