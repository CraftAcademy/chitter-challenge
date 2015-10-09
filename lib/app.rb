#app.rb

require 'sinatra/base'
require 'data_mapper'
require './lib/user.rb'

class ChitterApp < Sinatra::Base
  DataMapper.setup(:default, "postgres://localhost/chitter_test")
  DataMapper.finalize
   get '/' do
     "Hello, World!"
   end
end


#DataMapper.setup(:default, 'postgres::memory:')
#DataMapper.setup(:default, 'postgres://user:password@hostname/database')