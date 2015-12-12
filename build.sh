#!/usr/bin/env bash

# Using .version.conf as per
#   https://rvm.io/workflow/rvmrc
#
# To debug this script use
#   set -v

# Before using project run
# rvm gemset create install
# gem install bundler --no-rdoc --no-ri
# export BUNDLE_GEMFILE=$(pwd)/Gemfile
# bundle check  >/dev/null || bundle install

# run rake with parameters
bundle exec rake -f Rakefile $@
