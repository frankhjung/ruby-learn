require 'bundler/gem_tasks'
require 'rake/clean'
require 'rdoc/task'
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
end

desc 'Show bundle and Gem information'
task :info do
  # showing RVM information:
  # system 'rvm info'
  # system 'rvm list'
  # showing Gem information:
  # system 'gem list --local'
  system 'gem environment'
  # showing bundle information
  system 'bundle list'
  puts 'Showing stale gems:'
  system 'gem stale'
end

desc 'Check all Gem installed'
task :check do
  system 'bundle check'
  system 'bundle install'
  # system 'bundle update'
  system 'bundle list --verbose'
end

desc 'Check syntax using standard Ruby'
task syntax: :rubocop do
  ruby "-c #{srcs}"
end

desc 'Check project with RuboCop'
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
RDoc::Task.new do |rdoc|
  rdoc.main = 'README.md'
  rdoc.options << '--all'
  rdoc.rdoc_dir = 'rdocs'
  rdoc.rdoc_files.include('CHANGES')
  rdoc.rdoc_files.include('doc/*.rdoc')
  rdoc.rdoc_files.include('lib/*.rb')
  rdoc.rdoc_files.include('LICENSE')
  rdoc.rdoc_files.include('tests/*.rb')
  rdoc.rdoc_files.include('VERSION')
  rdoc.title = ENV['title'] || 'Ruby Learning Project'
end

Rake::VersionTask.new do |task|
  task.with_git_tag = true
end

CLEAN.include('**/*.bak', '**/*~')
CLOBBER.include('rdocs/', 'pkg/')
