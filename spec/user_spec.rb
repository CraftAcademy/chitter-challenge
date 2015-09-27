require 'users'
require 'bcrypt'

describe User do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :email }
  it { is_expected.to have_property :password_digest }

  it { is_expected.to validate_format_of(:email).with(:email_address) }
  it { is_expected.to validate_uniqueness_of :email }
  it { is_expected.to validate_presence_of :email }
  #it { is_expected.to validate_presence_of :password }


  it { is_expected.to have_many :peeps }

end
