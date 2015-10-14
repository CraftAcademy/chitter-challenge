#app.rb

require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-migrations'
require './lib/user.rb'
require './lib/peep.rb'
require 'bcrypt'
require 'database_cleaner'

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
    "Hello, Bro!"
  end

  get '/signup' do
    erb :signup
  end

  post '/register' do
    #binding.pry
    @user = User.create(name: params[:name],
                        email: params[:email],
                        username: params[:username],
                        password: params[:password],
                        password_confirm: params[:password_confirm])
    redirect '/'
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    #binding.pry
    @user =  User.authenticate(params[:email], params[:password])
    redirect '/'
  end


  get '/signout' do
    erb :signout
  end


 # get '/send_peep' do
  #  erb :send_peep
 #end


end

