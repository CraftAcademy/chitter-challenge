require './lib/peep.rb'


describe Peep do

  it { is_expected.to have_property :id }
  it { is_expected.to have_property :created_by_name }
  it { is_expected.to have_property :body }
  it { is_expected.to validate_length_of(:body). max(200) }
  it { is_expected.to have_property :created_at }

end