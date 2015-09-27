
require 'sinatra/base'
require 'sinatra/flash'
#require 'byebug'
require 'tilt/erb'
require 'data_mapper'
require 'dm-migrations'
require 'peep'
require 'users'

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

  get '/peeps' do
    @peeps = Peep.all(order: [ :created_at.desc ])
    erb :peeps
  end
end
