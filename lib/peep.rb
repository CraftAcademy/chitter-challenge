require 'peep'

class Peep

  include DataMapper::Resource

  property :id, Serial

  property :created_at, DateTime



end