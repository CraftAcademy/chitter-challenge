class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, DateTime
  property :created_by, String

end