feature 'user sign in' do

  before {visit '/'}

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
      visit '/sign_in'
      User.create(username: 'username', password: 'password', password_confirmation: 'password',name: 'name', email: 'email')
      fill_in 'username', :with => 'username'
      fill_in 'password', :with => 'password'
      click_button 'Sign in'
      expect(page.current_path).to eq '/dashboard'
      expect(page.status_code).to eq 200
    end

    scenario 'user cant sign in if password doesnt match' do
      User.create(username: 'username', password: 'password', password_confirmation: 'password',name: 'name', email: 'email')
      visit '/sign_in'
      fill_in 'username', :with => 'usernamer'
      fill_in 'password', :with => 'password_wrong'
      click_button 'Sign in'
      expect(page.current_path).to eq '/sign_in'
    end
end