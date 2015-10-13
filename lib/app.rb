#app.rb

require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
#require 'dm-migrations'
require './lib/user.rb'
require './lib/peep.rb'

class ChitterApp < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }
  enable :sessions
  register Sinatra::Flash
  set :session_secret, '1234567890'
  use Rack::Session::Pool
  env = ENV['RACK_ENV'] || "development"

  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
  DataMapper::Model.raise_on_save_failure = true

  get '/' do
    "Hello, World!"
  end
end
