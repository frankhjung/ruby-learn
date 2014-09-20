#!/usr/bin/env ruby

# Module of test classes.
# Author:: Frank Jung
# License:: see LICENSE
require 'version'

# Learn module
module Learn
  # Module version
  Version.current
  is_versioned

  # Test public and private class variables
  class ClassVariables
    # Public varible
    attr_writer :anyone
    attr_accessor :anyone
    # Private variable
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
