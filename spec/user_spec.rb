require 'user'

describe User do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :name }
  it { is_expected.to have_property :user_name }
  it { is_expected.to have_property :email }
  it { is_expected.to have_property :password_digest }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_length_of(:name). max(50) }
  it { is_expected.to validate_presence_of :user_name }
  it { is_expected.to validate_length_of(:user_name). max(25) }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_format_of(:email).with(:email_address) }
  it { is_expected.to validate_uniqueness_of :email }
  it { is_expected.to have_many :chits }
end

describe "Password encryption" do
      it "Encrypts password" do
      user = User.create(name: "Chris", user_name: "chrisco", email: "chris@chris.com", password: "right_password", password_confirm: "right_password")
      expect(user.password_digest.class).to eq BCrypt::Password
      expect(user.password_digest.version).to eq "2a"
      end
  end

  describe "User authentication" do
    before do
      @user = User.create(name: "Chris", user_name: "chrisco", email: "chris@chris.com", password: "right_password", password_confirm: "right_password")
    end

    it "With valid credentials" do
      expect(User.authenticate("chris@chris.com", "right_password")).to eq @user
    end

    it "With INVALID credentials" do
      expect(User.authenticate("chris@chris.com", "wrong-password")).to eq nil
    end
  end