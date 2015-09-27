feature "Share Chit" do
  before do
    visit "share_chit"
  end

  scenario "Render 'Share Chit' page if signed in" do

    create_and_login_user("git.chrisco@gmail.com", "password")
    visit "/share_chit"
    expect(page.current_path).to eq "/share_chit"
  end

  scenario "Route to Sign In page if NOT signed in" do
    expect(page.current_path).to eq "/sign_in"
  end

  # scenario "" do
  #   #
  # end
end
