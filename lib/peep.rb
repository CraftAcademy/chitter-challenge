class Peep

  include DataMapper::Resource

  property :id,                Serial
  property :name,              String
  property :user_name,         String
  property :peep_content,      String
  property :created_at,        DateTime

  belongs_to :user


  validates_presence_of :name
  validates_presence_of :user_name
  validates_presence_of :peep_content
  validates_length_of :peep, :maximum => 140, :too_long => '{{count}} characters is the maximum allowed'

  end
