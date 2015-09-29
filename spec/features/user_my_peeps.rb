feature 'my peeps' do

  background {visit '/'}

  scenario 'logged in user can visit my peeps path' do
    create_and_login_user
    click_button 'My Peeps'
    expect(page.current_path).to eq '/my_peepss'
  end

end