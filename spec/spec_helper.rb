ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'lib/app.rb')

require 'capybara'
require 'capybara/rspec'
require 'coveralls'
require 'simplecov'
require 'database_cleaner'
require 'dm-rspec'
require 'pry'
require 'rspec'
require 'tilt/erb'

def app
  App
end

Capybara.app = App

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Rack::Test::Methods
  config.include(DataMapper::Matchers)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
