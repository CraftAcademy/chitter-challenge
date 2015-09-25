
require 'sinatra/base'
#require 'byebug'
# require 'pry'
require 'tilt/erb'
require 'data_mapper'
require 'dm-migrations'
require './lib/peep.rb'


class App < Sinatra::Base

  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions
  set :session_secret, '123321123'
  use Rack::Session::Pool
  env = ENV['RACK_ENV'] || "development"
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_web_#{env}")

  get '/' do

    erb :index

  end

end

