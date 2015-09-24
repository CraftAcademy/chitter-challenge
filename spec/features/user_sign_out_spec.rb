feature 'user sign out' do

  before {visit '/sign_in'}

    scenario 'logged in user has a sign out button' do
      User.create(username: 'username', password: 'password', password_confirmation: 'password',name: 'name', email: 'email')
      fill_in 'username', :with => 'username'
      fill_in 'password', :with => 'password'
      click_button 'Sign in'
      expect(page).to have_content 'Sign Out'
    end

    xscenario 'logged in user can sign out' do
      User.create(username: 'username', password: 'password', password_confirmation: 'password',name: 'name', email: 'email')
      fill_in 'username', :with => 'username'
      fill_in 'password', :with => 'password'
      click_button 'Sign in'
      click_button 'Sign Out'
      expect(page).to not_have_content 'Sign Out'
    end
end