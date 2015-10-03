feature 'Send Peep' do

  scenario 'user cant send peep if not logged in' do
    visit '/'
    click_on 'Send Peep'
    expect(page.current_path).to eq '/sign_in'
  end

  scenario 'logged in user can click on send peep and reroutes to /send_peep path' do
    create_and_login_user
    click_on 'Send Peep'
    expect(page.current_path).to eq '/send_peep'
  end

  scenario '/send_peep path presents a message form to signed in users' do
    create_and_login_user
    visit '/send_peep'
    expect(page).to have_selector "form[action='/send_peep']"
    expect(page).to have_selector "input[type='submit']"
    expect(page).to have_button "Send Peep"
    expect(page.current_path).to eq '/send_peep'
  end

  scenario 'signed in user can send a peep' do
    create_and_login_user
    visit '/send_peep'
    fill_in 'message', with: 'Test message'
    click_button 'Send Peep'
    expect(page.current_path).to eq '/'
    expect(page).to have_content 'Test message'
  end

  scenario 'logged in user can visit my peeps path' do
    create_and_login_user
    click_on 'My Peeps'
    expect(page.current_path).to eq '/my_peeps'
    expect(page.status_code).to eq 200
  end

  scenario 'logged in user can only see my own peeps on My Peeps path' do
    create_login_user_send_message
    click_on 'Sign Out'
    create_login_user_send_message_2
    click_on 'My Peeps'
    expect(page).to have_content 'User2 message'
    expect(page).to_not have_content 'User1 message'
  end

end
