#!/usr/bin/env ruby

# Version for Learn module
require 'version'

# Version is read from projects VERSION file.
module Learn
  is_versioned
  Version.current
end
