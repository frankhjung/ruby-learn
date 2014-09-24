require 'rake/clean'
require 'bundler/gem_tasks'
require 'rake/version_task'
require File.expand_path('lib/version', File.dirname(__FILE__))

task :default => :test
task :all => [:clean, :clobber, :build, :test, :doc]

tests = FileList.new('tests/test_*.rb')
srcs = FileList.new('lib/*.rb') + tests

desc 'Show help'
task :help do
  puts 'For Rakefile help call:'
  puts '  rake -D'
  puts 'or'
  puts '  rake -T'
  system 'rvm list'
  system 'gem list --local'
end

desc 'Update Gem bundles'
task :update do
  system 'bundle check'
  system 'bundle install'
  system 'bundle update'
  system 'bundle list --verbose'
end

desc 'Check syntax'
task :check do
  ruby "-c #{srcs}"
  system "rubocop #{srcs}"
end

desc 'Run unit tests'
task :test => [:check] do
  ruby "#{tests}"
end

desc 'Document project'
task :doc do
  system "rdoc --all --output doc --main README -x README.md -x bin/learn"
end

Rake::VersionTask.new do |task|
  task.with_git_tag = true
end

CLEAN.include('**/*.bak', '**/*~')
CLOBBER.include('doc/', 'pkg/')
