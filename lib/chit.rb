class Chit

  include DataMapper::Resource

  property :id,         Serial
  property :chit_text,  String

  validates_presence_of :chit_text

end
