require 'chit'

describe Chit do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :chit_text }
  it { is_expected.to validate_presence_of :chit_text }
  it { is_expected.to validate_length_of(:chit_text). max(250) }
end
