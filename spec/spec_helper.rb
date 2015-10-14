ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'lib/app.rb')

require 'coveralls'
require 'capybara'
require 'capybara/rspec'
require 'simplecov'
require 'dm-rspec'
require 'pry'
require 'database_cleaner'
require 'bcrypt'

SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = ChitterApp

RSpec.configure do |config|
  config.include(Capybara::DSL)
  config.include(DataMapper::Matchers)

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end


end


