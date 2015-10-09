#app.rb

require 'sinatra'

class ChitterApp < Sinatra::Base
  get '/' do
    "Hello, World!"
  end
end