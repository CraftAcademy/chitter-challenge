#User.rb

require 'bcrypt'
require 'data_mapper'

class User

  attr_accessor :password, :password_confirm

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String, length: 300
  property :username, String
  property :email, String
  property :password_digest, Text

  validates_presence_of :name
  validates_length_of :name, maximum: 60
  validates_presence_of :username
  validates_length_of :username, maximum: 30


end



