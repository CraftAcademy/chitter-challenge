
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
  env = ENV['RACK_ENV'] || "development"
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_web_#{env}")

  DataMapper.finalize
  DataMapper.auto_upgrade!

  get '/' do
    @peeps = Peep.all(order: [ :created_at.desc ])
    erb :index
  end

  get '/join' do
    erb :join
  end

  post '/join' do
    if((params[:name] == '') || (params[:email] == '') || (params[:user_name] == '') || (params[:password] == '') || (params[:password_confirm] == ''))
      redirect 'join'
    else
      new_user = User.new
      new_user.name = params[:name]
      new_user.user_name = params[:user_name]
      new_user.email = params[:email]
      new_user.password = params[:password]
      new_user.password_confirm = params[:password_confirm]
      new_user.save
      redirect '/'
    end
  end

  get '/peeps' do
    @peeps = Peep.all(order: [ :created_at.desc ])
    erb :peeps
  end
end
