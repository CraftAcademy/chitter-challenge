ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'lib/app.rb')

require 'byebug'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'dm-rspec'
require 'pry'
require 'rspec'
require 'tilt/erb'
require 'coveralls' # Makers
require 'simplecov' # Makers

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
# Can replace `Coveralls.wear!` with  `SimpleCov.start` to get coverage stats locally.
# Then run `$ open coverage/index.html` from the command line to view details.
# SimpleCov.start

def app
  App
end

def create_and_login_user(email, password)
  User.create(name: "Chris", user_name: "chrisco", email: "git.chrisco@gmail.com", password: "password", password_confirm: "password")
  visit "/sign_in"
  fill_in "email", with: "git.chrisco@gmail.com"
  fill_in "password", with: "password"
  click_button "Sign In"
end

Capybara.app = App

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Rack::Test::Methods
  config.include(DataMapper::Matchers)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

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
