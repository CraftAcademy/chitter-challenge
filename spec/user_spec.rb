require './lib/user.rb'
require 'bcrypt'


describe User do

  it { is_expected.to have_property :id }
  it { is_expected.to have_property :name }
  it { is_expected.to have_property :username }
  it { is_expected.to have_property :email }
  it { is_expected.to have_property :password_digest }
  it { is_expected.to have_property :password_confirm }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of(:name). maximum(60) }
  it { is_expected.to validate_presence_of :username}
  it { is_expected.to validate_length_of(:username). maximum(30) }
  it { is_expected.to validate_presence_of :email}
  it { is_expected.to validate_format_of(:email).with(:email_address) }
  it { is_expected.to validate_uniqueness_of :email }

end


 #describe "Password" do

   # it "Encrypts password" do

      #user = User.new(name: "David", username: "david", email: "david@david.com", password: "1234", password_confirm: "1234")
      #expect(user.password_digest.class).to eq Bcrypt::Password
      #expect(user.passwor_digest.version).to eq '2a'
      #password.version  => "2a" "http://bcrypt-ruby.rubyforge.org/"
    #end

#end

