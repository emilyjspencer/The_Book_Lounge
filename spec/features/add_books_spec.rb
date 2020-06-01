feature 'Add books' do
  scenario 'The user can add a book' do
    visit('/') 
    click_button('Sign Up')
    visit('/users/new')
    fill_in('name', with: 'Emily')
    fill_in('email', with: 'emily@example.com')
    fill_in('password', with: 'password')
    click_button('Submit')
    visit('/books')
    fill_in('title', with: 'Frankenstein') 
    fill_in('author', with: 'Mary Shelley') 
    fill_in('genre', with: 'gothic') 
    fill_in('isbn', with: '9781977841438') 
    click_button('Add')
    visit('/books')
    expect(page).to have_content('New Books We Love')
  end

  
end