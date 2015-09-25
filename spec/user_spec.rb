require 'user'

describe User do

  it { is_expected.to have_property :id }
  it { is_expected.to have_property :username }
  it { is_expected.to validate_uniqueness_of :username }
  it { is_expected.to have_property :name }
  it { is_expected.to have_property :email }
  it { is_expected.to have_property :email }

  it { is_expected.to validate_uniqueness_of :email }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_presence_of :password_confirmation }

end
