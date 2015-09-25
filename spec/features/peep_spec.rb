require 'peep'

describe Peep do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :name }
  it { is_expected.to have_property :user_name }

end
