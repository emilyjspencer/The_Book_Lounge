feature 'Viewing books' do
  scenario 'the user can see the books that have been added' do
    Book.create_entry(title: 'The Hunger Games', author: 'Suzanne Collins', genre: 'adventure', isbn: '9781407109084')
    visit('/books')
    expect(page).to have_content('The Hunger Games')
  end
end 