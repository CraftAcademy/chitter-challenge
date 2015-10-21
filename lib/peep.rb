#require 'peep'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :created_by_name, String
  property :body, Text
  property :created_at, DateTime

  belongs_to :user

  validates_presence_of :body, body: "please be awesome, and fill in"
  validates_length_of :body, :maximum => 200

end