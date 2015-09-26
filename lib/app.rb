require 'sinatra/base'
# require 'byebug'
# require 'pry'
require 'data_mapper'
require 'dm-migrations'
require 'tilt/erb'
require './lib/chit'

class App < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions
  set :session_secret, '121212121212'
  use Rack::Session::Pool
  env = ENV['RACK_ENV'] || "development"
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/ohchit_#{env}")

  # DataMapper::Logger.new($stdout, :debug)
  DataMapper::Model.raise_on_save_failure = true
  DataMapper.finalize
  # DataMapper.auto_migrate!
  DataMapper.auto_upgrade!
  #byebug

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    if((params[:name] == '') || (params[:email] == '') || (params[:user_name] == '') || (params[:password] == '') || (params[:password_confirm] == ''))
      redirect '/sign_up'
    else
      # TODO: Write code to create and save a new user.  Use TDD.  Use 'before :save' block and authentication
      redirect '/'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
