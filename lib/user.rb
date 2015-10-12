#User.rb

require 'bcrypt'
require 'data_mapper'

class User

  attr_accessor :password, :password_confirm

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  #property :password, String

end
