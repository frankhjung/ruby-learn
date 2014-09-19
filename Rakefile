#!/usr/bin/rake

=begin
==References

* http://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing
* http://en.wikipedia.org/wiki/Rake_(software)
* https://rubygems.org/gems/rake
* http://www.ruby-doc.org/core-1.9.3/doc/rake/rakefile_rdoc.html
* http://pastie.org/242691
=end

require 'rake/clean'
require "bundler/gem_tasks"

task :default => :test
task :all => [:clean, :clobber, :bundle, :test, :doc]

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
  ruby '-c -w lib/*.rb tests/*rb'
  system 'rubocop lib/*.rb tests/*.rb'
end

desc 'Run unit tests'
task :test => [:check] do
  ruby 'tests/*.rb'
end

desc 'Produce documentation'
task :doc do
  system 'rdoc --all --op doc --tab-width=4 Gemfile Rakefile lib/*.rb tests/*.rb'
end

CLEAN.include('**/*.bak', '**/*~')
CLOBBER.include('doc/', 'pkg')
