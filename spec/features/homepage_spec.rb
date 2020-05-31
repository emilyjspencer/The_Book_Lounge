feature 'Displays message on homepage' do
  scenario 'User is greeted by a message on the homepage' do
    visit('/')
    expect(page).to have_button 'Sign Up'
  end
end 