require 'rake/clean'
require 'bundler/gem_tasks'
require 'rake/version_task'
require 'rubocop/rake_task'
require File.expand_path('lib/version', File.dirname(__FILE__))

task default: :test
task all: [:clean, :clobber, :build, :test, :doc]

tests = FileList.new('tests/test_*.rb')
srcs = FileList.new('lib/*.rb') + tests

desc 'Show help'
task :help do
  puts <<HELP
For Rakefile help call:
  rake -D

Or
  rake -T

To cleanup unused Gems use:

  bundle clean --force -V 
HELP
  puts 'Showing RVM information ...'
  system 'rvm info'
  system 'rvm list'
  puts 'Showing Bundle information ...'
  system 'bundle list'
  puts 'Showing Gem information ...'
  system 'gem list --local'
  puts 'Showing stale gems ...'
  system 'gem stale'
end

desc 'Update Gem bundles'
task :update do
  system 'bundle check'
  system 'bundle install'
  system 'bundle update'
  system 'bundle list --verbose'
end

desc 'Check syntax'
task check: :rubocop do
  ruby "-c #{srcs}"
end

desc 'Run RuboCop over project'
RuboCop::RakeTask.new(:rubocop) do |task|
  # files to check
  task.patterns = srcs
  # show failures in simple format
  task.formatters = ['simple']
  # continue on finding errors
  task.fail_on_error = false
  # show it working
  task.verbose = true
end

desc 'Run unit tests'
task test: :check do
  ruby "#{tests}"
end

desc 'Document project'
task :doc do
  system 'rdoc --all --output doc --main README -x README.md -x bin/learn'
end

Rake::VersionTask.new do |task|
  task.with_git_tag = true
end

CLEAN.include('**/*.bak', '**/*~')
CLOBBER.include('doc/', 'pkg/')
