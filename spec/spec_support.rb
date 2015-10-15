def create_user
  User.create(name: 'David',
              email: 'david@david.com',
              username: 'davidh',
              password: 'password',
              password_confirm: 'password')
end

def sign_in(user)
  visit '/signin'
  fill_in 'email', with: user.email
  fill_in 'password', with: 'password'
  click_button 'Submit'
end