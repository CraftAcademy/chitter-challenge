class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, DateTime
  property :created_by, String
  property :created_by_name, String

  belongs_to :user

  validates_presence_of :message, message: "Please fill in a peep message."

end