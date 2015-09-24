require 'sinatra/base'
require 'data_mapper'
require 'dm-migrations'
require 'bcrypt'
require './lib/user'


class Chitter < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions
  set :session_secret, '123321123'
  use Rack::Session::Pool
  env = ENV['RACK_ENV'] || "development"

  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
  DataMapper::Model.raise_on_save_failure = true

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    begin
      @user = User.create(:username => params[:username], :password => @params[:password], :password_confirmation => params[:password_confirmation], :name => params[:name], :email => params[:email],)
      session[:user_id] = @user.id
      redirect '/dashboard'
    rescue
      redirect 'sign_up'
    end
  end

  get '/dashboard' do
    erb :dashboard
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
