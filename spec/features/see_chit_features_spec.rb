feature "See Chit" do
  before do
    visit "see_chit"
  end

  scenario "The 'See Chit' page returns status code 200" do
    expect(page.status_code).to eq 200
  end

  scenario "Render 'See Chit' page" do
    expect(page).to have_content "Check this chit out!"
  end
end
