feature 'Add books' do
  scenario 'The user can add a book' do
    visit('/') 
    fill_in('title2', with: 'Frankenstein') 
    fill_in('author2', with: 'Mary Shelley') 
    fill_in('genre2', with: 'gothic') 
    fill_in('isbn2', with: '9781977841438') 
    click_button('Add')
    visit('/booksaddedtodb')
    expect(page).to have_content('Book added to the database')
  end
end