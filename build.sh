#!/usr/bin/env bash

# Ruby build script that will:
#
# * prepare gem set
# * update bundles
# * invoke rake

# prepare version of Ruby environment
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"
[[ -s /usr/local/rvm/scripts/rvm ]] && source /usr/local/rvm/scripts/rvm
if [[ -f .ruby-version && -f .ruby-gemset ]]; then 
    RVM_GEMSET=$(cat .ruby-version .ruby-gemset | tr "\\n" "@" | sed 's/@$//')
fi
if [[ -z "${RVM_GEMSET}" ]]; then
    echo "ERROR: no valid ruby gemset specified: ${RVM_GEMSET}"
    exit
else
    rvm --create --install use ${RVM_GEMSET}
fi

# prepare bundler
export BUNDLE_GEMFILE=Gemfile
which bundle | grep ${RVM_GEMSET} >/dev/null || gem install bundler --no-rdoc --no-ri
bundle check >/dev/null || bundle install

# run ruby build with parameters
bundle exec rake -f Rakefile $@
