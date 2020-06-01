feature 'Deleting books' do
    scenario 'A user can delete a book' do
      Book.create_entry(title: 'The Princess Diaries', author: 'Meg Cabot', genre: 'humour', isbn: '9780330482059')
      visit('/books')
      expect(page).to have_content('The Princess Diaries')
      first('.book').click_button 'Delete'
      expect(current_path).to eq '/books'
      expect(page).not_to have_content('The Princess Diaries')
    end
  end