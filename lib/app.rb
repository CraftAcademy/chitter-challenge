
require 'sinatra/base'
#require 'byebug'
require 'tilt/erb'
require 'data_mapper'
require 'dm-migrations'
require './lib/peep'
require './lib/users'

class App < Sinatra::Base

  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions
  set :session_secret, '123321123'
  use Rack::Session::Pool
  env = ENV['RACK_ENV'] || "dev"
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_web_#{env}")

  DataMapper.finalize
  DataMapper.auto_upgrade!

  get '/' do
    @peeps = Peep.all(order: [ :created_at.desc ])
    erb :index

  end

  get '/peeps' do
    @peeps = Peep.all(order: [ :created_at.desc ])
    erb :'peeps/index'
  end


  get '/users/new_user' do
    erb :'users/new_user'
  end
end

