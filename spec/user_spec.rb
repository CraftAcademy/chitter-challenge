require 'user'

describe User do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :name }
  it { is_expected.to have_property :user_name }
  it { is_expected.to have_property :email }
  it { is_expected.to have_property :password_digest }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :user_name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password_digest }
  it { is_expected.to validate_format_of(:email).with(:email_address) }
  it { is_expected.to validate_uniqueness_of :email }
  it { is_expected.to have_many :chits }
end