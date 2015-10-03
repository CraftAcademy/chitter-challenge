require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-migrations'
require 'bcrypt'
require './lib/user'
require './lib/peep'
require 'byebug'


class Chitter < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }
  enable :sessions
  register Sinatra::Flash
  set :session_secret, '123321123'
  use Rack::Session::Pool
  env = ENV['RACK_ENV'] || "development"

  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
  #DataMapper.auto_migrate!
  DataMapper::Model.raise_on_save_failure = true

  before do
    @user = User.get(session[:user_id]) unless is_user?
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
      @user = User.create(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name], email: params[:email],)
      session[:user_id] = @user.id
      flash[:notice] = 'Hey, you made it! Welcome to the wonderful world of Chitter.'
      redirect '/'
    rescue
      flash[:warning] = 'Couldn\'t register. Username or e-mail may be taken. Please try again'
      redirect 'sign_up'
    end
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    if @user = User.authenticate(params[:username], params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}"
      redirect '/'
    else
      flash[:warning] = 'Oups! Couldn\'t login. Please check username and password and try again.'
      redirect 'sign_in'
    end
  end

  get '/sign_out' do
    session[:user_id] = nil
    flash[:notice] = "Thanks for today #{@user.username}. Welcome back!"
    redirect '/'
  end

  get '/send_peep' do
    if session[:user_id] == nil
      flash[:warning] = 'Please sign in and then you can send a Peep message.'
      redirect '/sign_in'
    else
      erb :send_peep
    end
  end

  post '/send_peep' do
    Peep.create(message: params[:message], created_at: Time.now, created_by: @user.username, created_by_name: @user.name, user_id: @user.id)
    redirect '/'
  end

  get '/my_peeps' do
    if session[:user_id] == nil
      flash[:warning] = 'Please sign in to see your Peep messages.'
      redirect '/sign_in'
    else
      erb :my_peeps
    end
  end

  get '/delete/:id' do
    peep = Peep.get(params[:id])
    if !@user.is_creator_of?(peep)
      flash[:warning] = 'You can\'t delete this message.'
      redirect '/'
    else
      peep.destroy!
      flash[:notice] = 'Your Peep message has been deleted.'
      redirect '/my_peeps'
    end
  end

  get '/update_peep/:id' do
    @peep = Peep.get(params[:id])
    if !@user.is_creator_of?(@peep)
      flash[:warning] = 'You can\'t update this message.'
      redirect '/'
    else
      erb :update_peep
    end

  end

  post '/update_peep/:id' do
    peep = Peep.get(params[:id])
    peep.update(message: params[:message]) if @user.is_creator_of?(peep)
    flash[:notice] = 'Your Peep message has been updated.'
    redirect '/my_peeps'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
