feature 'application setup' do
  feature 'root path' do

    scenario 'is sucessfull' do
      visit '/'
      expect(page.status_code).to be 200
    end

        scenario 'it has a chitter button' do
      visit '/'
      expect(page).to have_content 'Chitter'
    end

    scenario 'it has a peep button' do
      visit '/'
      expect(page).to have_content 'Send Peep'
    end

    scenario 'it has sign up button' do
      visit '/'
      expect(page).to have_content 'Sign Up'
    end

    scenario 'it has a sign in button' do
      visit '/'
      expect(page).to have_content 'Sign In'
    end

  end
end