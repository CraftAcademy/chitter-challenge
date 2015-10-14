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

  before do
    @user = User.get(session[:user_id]) unless is_user?
  end

  register do
    def auth (type)
      condition do
        redirect '/signin' unless send("is_#{type}?")
      end
    end
  end

  helpers do
    def is_user?
      @user != nil
    end

    def current_user
      @user
    end
  end

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
    flash[:notice] = "Welcome #{@user.email}!"
    redirect '/'

  end


  get '/signout' do
    erb :signout
  end


 # get '/send_peep' do
  #  erb :send_peep
 #end


end

