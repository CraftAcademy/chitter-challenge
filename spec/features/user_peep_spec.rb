feature 'user peep' do

  background { visit '/' }

  scenario 'Send Peep path works' do
    visit '/send_peep'
    expect(page.status_code).to eq 200
  end
end