feature "Updating a book record" do
  scenario "allows a user to update a book record" do
    Book.create_entry(title: 'Frankenstein', author: 'Mary Shelley', genre: 'gothic', isbn: '9781847493507')
    visit('/books')
    expect(page).to have_content('Frankenstein')
    Book.create_entry(title: 'The Princess Diaries', author: 'Meg Cabot', genre: 'humour', isbn: '9780330482059')
    visit('/books')
    expect(page).to have_content('The Princess Diaries')
    fill_in('title', with: 'The Princess Diaries Take Two')
    fill_in('author', with: 'Meg Cabot')
    fill_in('genre', with: 'Humour')
    fill_in('isbn', with: '9781405034104')
    click_button('Update Book Record')
    expect(page).not_to have_content('The Princess Diaries')
    expect(page).to have_content('The Princess Diaries Take Two')
  end
end 