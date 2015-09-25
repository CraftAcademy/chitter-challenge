class Peep

  include DataMapper::Resource

  property :id,         Serial
  property :peep_text,  String

  validates_presence_of :peep_text

end