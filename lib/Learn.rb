#!/usr/bin/env ruby

# Module of test classes
module Learn
  # Module version
  module Version
    # major
    MAJOR = 0
    # minor
    MINOR = 1
    # path
    PATCH = 0
  end
  # Module Version
  VERSION = [Version::MAJOR, Version::MINOR, Version::PATCH].compact * '.'

  # Test public and private class variables
  class ClassVariables
    # Class version inherited from module
    VERSION = [Version::MAJOR, Version::MINOR, Version::PATCH].compact * '.'

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
