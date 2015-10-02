feature 'user sign out' do

  background do
    create_and_login_user
  end

  scenario 'logged in user has a sign out button' do
    expect(page).to have_content 'Sign Out'
  end

  scenario 'logged in user can sign out' do
    click_on 'Sign Out'
    expect(page).not_to have_content 'Sign Out'
  end
end