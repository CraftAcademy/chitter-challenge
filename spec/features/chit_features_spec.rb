feature "Share Chit" do
  before do
    visit "share_chit"
  end

  scenario "Render 'Share Chit' page if signed in" do
    create_and_login_user("git.chrisco@gmail.com", "password")
    visit "/share_chit"
    expect(page.current_path).to eq "/share_chit"
  end

  scenario "Render 'Share Chit' form if signed in" do
    create_and_login_user("git.chrisco@gmail.com", "password")
    visit "/share_chit"
    expect(page).to have_selector "form[action='/share_chit']"
    expect(page).to have_selector "form[method='post']"
    expect(page).to have_selector "input[name='chit_text']"
    expect(page).to have_selector :link_or_button, "Share Chit"
  end

  scenario "Route to 'Sign In' page if NOT signed in" do
    expect(page.current_path).to eq "/sign_in"
  end
end
