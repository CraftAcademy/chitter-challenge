require 'peep'

describe Peep do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :peep_content}
  it { is_expected.to validate_length_of(:peep_content). max(250) }
end







