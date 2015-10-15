


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
      user = create_user
      visit '/signin'
      fill_in 'email', with: user.email
      fill_in 'password', with: 'password'
      click_button 'Submit'
      expect(page.current_path).to eq '/'
      expect(page).to have_text 'davidh'

    end



    scenario 'can sign-out' do
      user = create_user
      sign_in(user)
      expect(page.current_path).to eq '/'
      visit '/signout'
      click_button 'Submit'
      expect(page.current_path).to eq '/signout'
     # expect(@user).to be nil
    end


  end

  feature 'sending peeps' do

    scenario 'user can send a peep' do
      user = create_user
      sign_in(user)
      expect(page.current_path).to eq '/'
    end
  end
end