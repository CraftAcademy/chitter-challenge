ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'lib/app.rb')

require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!