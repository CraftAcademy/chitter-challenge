feature 'user sign in' do

  background {visit '/'}

    scenario 'click on button sign in route to /sign_in page' do
      click_on 'Sign In'
      expect(page.current_path).to eq '/sign_in'
      expect(page.status_code).to eq 200
    end

    scenario 'displays a user /sign_in form' do
      visit '/sign_in'
      expect(page).to have_selector "form[action='/sign_in']"
      expect(page).to have_selector "input[type='text']"
      expect(page).to have_selector "input[name='username']"
      expect(page).to have_selector "input[name='password']"
      expect(page).to have_selector "input[type='submit']"
      expect(page).to have_button "Sign in"
    end

    scenario 'user can sign in' do
      create_user
      visit '/sign_in'
      fill_in 'username', :with => 'username'
      fill_in 'password', :with => 'password'
      click_button 'Sign in'
      expect(page.current_path).to eq '/'
      expect(page.status_code).to eq 200
      expect(page).to have_content 'Signed in as: username'
    end

    scenario 'user cant sign in if password doesnt match' do
      create_user
      visit '/sign_in'
      fill_in 'username', :with => 'usernamer'
      fill_in 'password', :with => 'password_wrong'
      click_button 'Sign in'
      expect(page.current_path).to eq '/sign_in'
      expect(page).not_to have_content 'Signed in as: username'
    end
end