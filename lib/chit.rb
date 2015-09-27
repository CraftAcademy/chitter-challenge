class Chit

  include DataMapper::Resource

  property :id,         Serial
  property :chit,       String

  validates_presence_of :chit

end
