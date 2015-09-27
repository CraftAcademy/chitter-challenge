class Peep

  include DataMapper::Resource

  property :id,                Serial
  property :peep_content,      String
  property :created_at,        DateTime

  belongs_to :user


  validates_presence_of :peep_content
  validates_length_of :peep_content, length: { maximum: 140 }

  end
