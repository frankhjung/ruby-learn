#!/usr/bin/env ruby

# RUBY HINTS
# Alternate declaration for relative class is
#   require File.expand_path('../lib/Learn.rb', File.dirname(__FILE__))
# Or
#   require_relative 'lib/Learn'

require './lib/Learn.rb'
require 'tempfile'
require 'minitest'
require 'minitest/autorun'
require 'uri'
require 'uri/http'

# Test Ruby scripts. This is a Ruby Learning project.
#
# Tested with Ruby version:
#
# * tested on ruby 1.9.3p484 (2013-11-22 revision 43786) [x86_64-linux].
#
# MiniTest:
#
# * https://github.com/seattlerb/minitest
#
class TestLearn < Minitest::Test
  # URI - site
  HOME = '~frankhjung'
  # URI - start page
  HOMEPAGE = 'index.html'
  # URI - host
  IINET = 'members.iinet.net.au'
  # URI - ISP site
  ISP = 'http://' + IINET
  # URI - path seperator
  SEP = '/'

  # Test directory globbing.
  #
  # References:
  #
  # * http://www.ruby-doc.org/stdlib-1.9.3/libdoc/tempfile/rdoc/Tempfile.html
  # * http://ruby-doc.org/core-1.9.3/Dir.html
  # * http://www.ruby-doc.org/core-1.9.3/File.html
  def test_dir_glob
    tempfile = Tempfile.new(%w(temp txt))
    tempname = tempfile.path
    assert(1 == Dir.glob(tempname).length, "expected #{tempname}")
    tempfile.close!
    assert(0 == Dir.glob(tempname).length, "unexpected #{tempname}")
  end

  # Test URI paths:
  #
  # * test: http://members.iinet.net.au
  # * test: http://members.iinet.net.au/~frankjung
  # * test: http://members.iinet.net.au/~frankjung/index.html
  #
  # References:
  #
  # * http://ruby-doc.org/stdlib-1.9.3/libdoc/uri/rdoc/URI.html
  def test_uri_path_joins
    iinet = URI(ISP)
    assert_equal(IINET, iinet.host)
    assert_equal(80, iinet.port)
    iinet = URI.join(ISP, HOME)
    assert_equal([ISP, HOME].join(SEP), iinet.to_s)
    home = [SEP, HOME, SEP].join
    iinet = URI.join(ISP, home, HOMEPAGE)
    assert_equal([ISP, HOME, HOMEPAGE].join(SEP), iinet.to_s)
  end

  # Test URI builds:
  #
  # * test: http://members.iinet.net.au/~frankjung/index.html
  #
  # Reference:
  #
  # * http://ruby-doc.org/stdlib-1.9.3/libdoc/uri/rdoc/URI/HTTP.html
  def test_uri_http_build
    path = ['', HOME, HOMEPAGE].join(SEP)
    iinet = URI::HTTP.build(host: IINET, path: path)
    assert_equal(IINET, iinet.host)
    assert_equal(80, iinet.port)
    assert_equal(path, iinet.path)
    assert_equal([ISP, HOME, HOMEPAGE].join(SEP), iinet.to_s)
  end

  # Should have module and class version set
  def test_module_version
    assert_equal('0.1.0', Learn::VERSION)
    assert_equal(0, Learn::Version::MAJOR)
    assert_equal(1, Learn::Version::MINOR)
    assert_equal(0, Learn::Version::PATCH)
    assert_equal('0.1.0', Learn::ClassVariables::VERSION)
  end

  # Should be able to access public methods
  def test_public_variable
    mytest = Learn::ClassVariables.new
    mytest.anyone = 'public'
    assert_equal('public', mytest.anyone)
    assert_equal('PUBLIC', mytest.show)
  end

  # No access to private class variables or methods
  def test_private_variable
    mytest = Learn::ClassVariables.new
    mytest.anyone = 'public'
    assert_raises NoMethodError do
      mytest.secret
    end
    assert_raises NoMethodError do
      mytest.spy
    end
  end
end
