feature "Sign Up" do
  before do
    visit "sign_up"
  end

  scenario "Render sign-up form" do
    expect(page).to have_selector "form[action='/sign_up']"
    expect(page).to have_selector "form[method='post']"
    expect(page).to have_selector "input[name='name']"
    expect(page).to have_selector "input[name='user_name']"
    expect(page).to have_selector "input[name='email']"
    expect(page).to have_selector "input[name='password']"
    expect(page).to have_selector "input[name='password_confirm']"
  end

  scenario "Create a new user when valid inputs are submitted" do
    expect(User.count).to eq 0
    fill_in "name", with: "Chris"
    fill_in "user_name", with: "chrisco"
    fill_in "email", with: "git.chrisco@gmail.com"
    fill_in "password", with: "right-password"
    fill_in "password_confirm", with: "right-password"
    click_button "Sign Up"
    expect(User.count).to eq 1
  end

    # TODO: In real world test missing or invalid inputs on all relevant fields (and render applicable error flash message to user)
    scenario "Do NOT create a new user when INVALID inputs are submitted" do
    expect(User.count).to eq 0
    fill_in "name", with: ""
    fill_in "user_name", with: "chrisco"
    fill_in "email", with: "git.chrisco@gmail.com"
    fill_in "password", with: "right-password"
    fill_in "password_confirm", with: "right-password"
    click_button "Sign Up"
    expect(User.count).to eq 0
    expect(page).to have_content "You submitted invalid data.  Please try again."
  end
end

feature "Sign In" do
  before do
    visit "/sign_in"
  end

  scenario "Render sign-in form" do
    expect(page).to have_selector "form[action='/sign_in']"
    expect(page).to have_selector "form[method='post']"
    expect(page).to have_selector "input[name='email']"
    expect(page).to have_selector "input[name='password']"
  end

scenario "Allow registered user to sign in when valid inputs are submitted" do
    create_and_login_user("git.chrisco@gmail.com", "password")
    expect(page.current_path).to eq "/"
    expect(page).to have_content "Welcome Chris!"
  end
end

feature "Sign Out" do
  scenario "When signed-in users click the 'Sign Out' button, they are signed out" do
    create_and_login_user("git.chrisco@gmail.com", "password")
    visit "/sign_out"
    expect(page).to have_content "Catcha ya later, dude!"
  end
end
