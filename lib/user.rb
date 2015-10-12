#User.rb

require 'bcrypt'
require 'data_mapper'

class User

  attr_accessor :password, :password_confirm

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String, length: 300
  property :username, String, length: 300, unique: true, message: "This username is taken, think harder"
  property :email, String, format: :email_address, unique: true, message: "Try again! E-mail is already taken!"
  property :password_digest, Text

  validates_presence_of :name
  validates_length_of :name, maximum: 60
  validates_presence_of :username
  validates_length_of :username, maximum: 30
  validates_presence_of :email
  #validates_uniqueness_of :email



end



