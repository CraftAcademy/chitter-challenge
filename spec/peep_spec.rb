require './lib/peep.rb'


describe Peep do

  it { is_expected.to have_property :id }
  #it { is_expected.to have property :content }
  #it { is_expected.to validate_length_of(:peep_content). max(200) }
  #it { is_expected.to have property :created_at }
  #it { is_expected.to have property :created_by_name }

end