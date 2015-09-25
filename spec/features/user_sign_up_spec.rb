feature 'user sign up' do

    before {visit '/'}

    scenario 'click on button sign up route to /sign_up page' do
      click_on 'Sign Up'
      expect(page.current_path).to eq '/sign_up'
      expect(page.status_code).to eq 200
    end

    scenario 'displays a user /sign_up form' do
      visit '/sign_up'
      expect(page).to have_selector "form[action='/sign_up']"
      expect(page).to have_selector "input[type='text']"
      expect(page).to have_selector "input[name='username']"
      expect(page).to have_selector "input[name='password']"
      expect(page).to have_selector "input[name='password_confirmation']"
      expect(page).to have_selector "input[name='name']"
      expect(page).to have_selector "input[name='email']"
      expect(page).to have_selector "input[type='submit']"
      expect(page).to have_button "Sign Up"
    end

    scenario 'user can sign up' do
      expect(User.count).to eq 0
      visit '/sign_up'
      fill_in 'username', :with => 'username'
      fill_in 'password', :with => 'password'
      fill_in 'password_confirmation', :with => 'password'
      fill_in 'name', :with => 'name'
      fill_in 'email', :with => 'email'
      click_button 'Sign Up'
      expect(User.count).to eq 1
      expect(page.current_path).to eq '/'
      expect(page.status_code).to eq 200
    end

    scenario 'user cant sign up if password doesnt match' do
      expect(User.count).to eq 0
      visit '/sign_up'
      fill_in 'username', :with => 'username'
      fill_in 'password', :with => 'password'
      fill_in 'password_confirmation', :with => 'wrong_password'
      fill_in 'name', :with => 'name'
      fill_in 'email', :with => 'email'
      click_button 'Sign Up'
      expect(User.count).to eq 0
      expect(page.current_path).to eq '/sign_up'
    end
end