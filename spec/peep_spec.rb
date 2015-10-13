require './lib/peep.rb'


describe Peep do

  it { is_expected.to have_property :id }
  it { is_expected.to have_property :created_at }


end