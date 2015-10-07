require 'data_mapper'

class User

	include DataMapper::Resource

	#attr_accessor :password

  property :id,         Serial
  property :name,		    String
	#property :username		String
	#property :email			String
  #property :password		
end