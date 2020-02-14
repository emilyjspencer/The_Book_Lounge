feature 'Displays message on homepage' do
  scenario 'User is greeted by a message on the homepage' do
    visit('/')
    expect(page).to have_content 'Looking for your next read?'
    expect(page).to have_content 'Look no further...'
  end
end 