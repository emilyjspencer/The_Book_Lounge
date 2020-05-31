feature 'viewing books' do
  scenario 'the use can see the books that have been added' do
    Book.create_entry(title: 'The Hunger Games', author: 'Suzanne Collins', genre: 'adventure', isbn: '9781407109084')
    Book.create_entry(title: 'Divergent', author: 'Veronica Roth', genre: 'dystopian', isbn: '9780007538034')
    visit('/books')
    expect(page).to have_content('The Hunger Games')
    expect(page).to have_content('Divergent')
  end
end 