feature "Join" do
  before do
    visit "join"
  end

  scenario "creates Join form" do
    expect(page).to have_selector "form[action='/join']"
    expect(page).to have_selector "form[method='post']"
    expect(page).to have_selector "input[name='name']"
    expect(page).to have_selector "input[name='user_name']"
    expect(page).to have_selector "input[name='email']"
    expect(page).to have_selector "input[name='password']"
    expect(page).to have_selector "input[name='password_confirm']"
  end

  scenario "creates a new user with valid inputs" do
    expect(User.count).to eq 0
    fill_in "name", with: "Bo"
    fill_in "user_name", with: "bottelotte"
    fill_in "email", with: "bo@cint.com"
    fill_in "password", with: "password"
    fill_in "password_confirm", with: "password_confirm"
    click_button 'Join Chitter !'
    expect(User.count).to eq 1
  end




end

