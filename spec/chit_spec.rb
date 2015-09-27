require 'chit'

describe Chit do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :chit }
  it { is_expected.to validate_presence_of :chit }
end
