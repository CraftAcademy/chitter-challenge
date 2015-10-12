require './lib/user.rb'


describe User do

  it { is_expected.to have_property :id }
  it { is_expected.to have_property :name }
  it { is_expected.to have_property :username }
  it { is_expected.to have_property :email }
  it { is_expected.to have_property :password_digest }
  it { is_expected.to validate_presence_of :name }

end

 #describe "Password encryption" do
  # it "Encrypts password" do
   # user = User.create(name: "David", username: "david", email: "david@david.com", password: "1234", password_confirm: "1234")
    #expect(user.password_digest.class).to eq Bcrypt::Password

   #end

# end