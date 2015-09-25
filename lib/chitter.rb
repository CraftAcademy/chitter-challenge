require 'sinatra/base'
require 'data_mapper'
require 'dm-migrations'
require 'bcrypt'
require './lib/user'
require './lib/peep'


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

  before do
    @user = User.get(session[:user_id]) unless is_user?
    @user = User.get(session[:username]) unless is_user?
  end

  def is_user?
    @user != nil
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    begin
      @user = User.create(:username => params[:username], :password => @params[:password], :password_confirmation => params[:password_confirmation], :name => params[:name], :email => params[:email],)
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect '/dashboard'
    rescue
      redirect 'sign_up'
    end
  end

  get '/dashboard' do
    erb :dashboard
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    if
      @user = User.authenticate(params[:username], params[:password])
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect '/'
    else
      redirect 'sign_in'
    end
  end

  get '/sign_out' do
    session[:user_id] = nil
    redirect '/'
  end

  get '/send_peep' do
    if session[:user_id] == nil
      redirect '/sign_in'
    else
      erb :send_peep
    end
  end

  post '/send_peep' do
    @title = params[:title]
    @description = params[:description]
    @url = params[:url]
    @peep = Peep.create(:message => params[:message], :created_at => Time.now, :created_by => session[:username])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
