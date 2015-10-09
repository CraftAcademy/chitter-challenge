require './lib/user.rb'

describe User do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :username }
end