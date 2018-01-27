#!/usr/bin/env ruby
# frozen_string_literal: true

# Module of test classes.
# Author:: Frank Jung
# License:: see LICENSE
require 'version'

# Learn module
module Learn
  # This module is versioned
  Version.current
  is_versioned

  # Test public and private class variables
  class ClassVariables
    # Public varibles
    # attr_writer :anyone
    attr_accessor :anyone

    # Private variables
    attr_reader :secret

    private :secret

    # Class constructor. Initialises instance variables
    def initialize
      @anyone = ''
      @secret = 'I am private!'
    end

    # Show private instance variable
    def show
      @anyone.upcase
    end

    private

    # Show private instance variable
    def spy
      @secret.upcase
    end
  end
end
