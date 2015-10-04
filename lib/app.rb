
require 'sinatra/base'
require 'sinatra/flash'
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

  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all(order: [ :created_at.desc ])
    erb :index
  end

  get '/join' do
    erb :join
  end

  post '/join' do
    if((params[:name] == '') || (params[:email] == '') || (params[:user_name] == '') || (params[:password] == '') || (params[:password_confirm] == ''))
      flash[:warning] = "You must have missed a field, please try again."
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

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    if((params[:email] == '') || (params[:password] == ''))
      flash[:warning] = "You submitted invalid data.  Please try again."
      redirect '/sign_in'
    else
      # I'm not sure about this "begin / rescue" business.
      # Got it from Thomas and need to learn more about it.
      # https://github.com/tochman/my_app/blob/master/lib/my_app.rb#L76
      # Leaving it here as a reminder and question.
      begin
        email = params[:email]
        password = params[:password]
        @user = User.authenticate(email, password)
        session[:user_id] = @user.id
        flash[:notice] = "Welcome #{@user.name}!"
        redirect '/'
        rescue
          flash[:warning] = "You submitted invalid data.  Please try again."
          redirect "/sign_in"
      end
    end
  end

  get '/share_peep' do
    if session[user_id]== nil
      flash[:warning] = "Please sign in first!"
      redirect 'sign_in'
    else
      @peeps = Peep.all(order: [ :created_at.desc ])
      erb :share_peep
    end

  end

  post '/share_peep' do
    Peep.create(message: params[:message], created_at: Time.now, created_by: @user.username, created_by_name: @user.name, user_id: @user.id)
    redirect '/'
  end

  get '/sign_out' do
    session[:user_id] = nil
    flash[:notice] = "Thanks for today #{@user.username}. Welcome back!"
    redirect '/'
  end

end
