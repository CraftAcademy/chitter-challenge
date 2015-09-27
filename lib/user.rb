require 'bcrypt'

class User

	attr_accessor :password, :password_confirm

	include DataMapper::Resource
	include BCrypt

	property :id, 				Serial
	property :name,				String, length: 255
	property :username,			String, format: :username, unique: true, message: "Sorry, this username has already beem taken"
	property :email,			String, format: :email_address, unique: true, message: "Sorry, this email has already been taken"
	property :password_digest 	Text, length: 255
	property :created_at,		DateTime
end