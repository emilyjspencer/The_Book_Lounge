feature 'Adding reviews' do
  scenario 'A user can add review to the books they have saved' do
    book = Book.create_entry(title: 'The Princess Diaries: Take Two', author: 'Meg Cabot', genre: 'Humour', isbn: '9781405034104)')
    visit('/books')
    click_button('Add review')
    expect(current_path).to eq '/books/#{book.id}/reviews/new'
    fill_in 'review', with: "This was a brilliant book!"
    click_button 'Submit'
    expect(current_path).to eq '/books'
    expect(first('.book')).to have_content 'This was a brilliant book1'
  end
end 