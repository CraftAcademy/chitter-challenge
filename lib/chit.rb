class Chit

  include DataMapper::Resource

  property :id,         Serial
  property :chit_text,  String, length: 255 # TODO: Add validation
  property :created_at, DateTime

  belongs_to :user

  validates_presence_of :chit_text
  validates_length_of :chit_text, maximum: 250

end
