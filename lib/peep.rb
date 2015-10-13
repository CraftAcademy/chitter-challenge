require 'peep'

class Peep

  include DataMapper::Resource

  property :id, Serial
  #property :content, String
  #property :created_at, Datetime
  #property :created_by_name. String

  #belongs_to :user

  #validates_presence_of :peep_content
  #validates_length_of :peep_content, :maximum => 200

end