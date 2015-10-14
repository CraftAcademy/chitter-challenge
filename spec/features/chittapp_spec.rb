feature 'Chitter app' do

  feature 'user management' do

    scenario 'can sign up' do
      visit '/signup'
      expect(page).to have_css "form[action='/register']"
      fill_in 'name', with: 'David'
      fill_in 'email', with: 'david@david.com'
      fill_in 'username', with: 'davidh'
      fill_in 'password', with: 'password'
      fill_in 'password_confirm', with: 'password'
      click_button 'Submit'
      expect(page.current_path).to eq '/'
    end

    scenario 'can sign-in' do
      user = User.create(name: 'David',
                         email: 'david@david.com',
                         username: 'davidh',
                         password: 'password',
                         password_confirm: 'password')
      visit '/signin'
      fill_in 'email', with: user.email
      fill_in 'password', with: 'password'
      click_button 'Submit'
      expect(page.current_path).to eq '/signin'

    end


  end

end