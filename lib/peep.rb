require 'peep'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :created_at, DateTime

  validates_presence_of :body
  validates_length_of :body, :maximum => 200



end