class Peep

  include DataMapper::Resource

  property :id,                Serial
  property :name,              String
  property :user_name,         String
  property :created_at,        DateTime

  belongs_to :user
  has n, :peeps, through: Resource

  validates_presence_of :name
  validates_presence_of :user_name

  end
