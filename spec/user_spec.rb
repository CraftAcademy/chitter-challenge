require 'users'
require 'bcrypt'
#require 'launchy'

describe User do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :email }
  it { is_expected.to have_property :password_digest }

  it { is_expected.to validate_format_of(:email).with(:email_address) }
  it { is_expected.to validate_uniqueness_of :email }
  it { is_expected.to validate_presence_of :email }
  #it { is_expected.to validate_presence_of :password }


  it { is_expected.to have_many :peeps }

  describe 'Password encryption' do
    it 'encrypts password' do
      user = User.create(name: 'Bo', user_name: 'bottelotte', email: 'bo@cint.com', password: 'password', password_confirm: 'password')
      expect(user.password_digest.class).to eq BCrypt::Password
      expect(user.password_digest.version).to eq '2a'
    end

  end

  describe "User authentication" do
    before do
      @user = User.create(name: 'Bo', user_name: 'bottelotte', email: 'bo@cint.com', password: 'password', password_confirm: 'password')
    end

    it "With valid credentials" do
      expect(User.authenticate('bo@cint.com', 'password')).to eq @user
    end

    it "With invalid credentials" do
      expect(User.authenticate('bo@cint.com', 'other-password')).to eq nil
    end
  end

  feature 'Sign In' do
    before do
      visit '/sign_in'
    end

    scenario "Render sign-in form" do
      expect(page).to have_selector "form[action='/sign_in']"
      expect(page).to have_selector "form[method='post']"
      expect(page).to have_selector "input[name='email']"
      expect(page).to have_selector "input[name='password']"
    end

    scenario 'signs in user with valid credentials' do
      User.create(email: 'bo@cint.com', password: 'password', password_confirm: 'password')
      visit '/sign_in'
      fill_in 'email', with: 'bo@cint.com'
      #save_and_open_page
      fill_in 'password', with: 'password'
      click_button 'Sign In'
      expect(page.current_path).to eq '/'
      expect(page).to have_content 'Hullo Bottelotte!'
    end

  end

end
