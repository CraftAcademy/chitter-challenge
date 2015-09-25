# chitter.rb

require 'sinatra/base'
# require 'byebug'
# require 'pry'
require 'tilt/erb'
require 'data_mapper'
require 'dm-migrations'

class Chitter < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions
  set :session_secret, '1233321123'
  use Rack::Session::Pool
  env = ENV['RACK_ENV'] || "development"
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_dev#{env}")

  # DataMapper::Logger.new($stdout, :debug)
  DataMapper::Model.raise_on_save_failure = true
  DataMapper.finalize
  #DataMapper.auto_migrate!
  DataMapper.auto_upgrade!
  #byebug

  get '/' do
    erb :index
  end

    run! if app_file == $0
end