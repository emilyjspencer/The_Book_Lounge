require 'book'
require 'database_helpers'

 describe Book do
 
   describe '.create_entry' do
     it 'creates a new book entry' do
     book = Book.create_entry(title: 'Frankenstein', author: 'Mary Shelley', genre: 'gothic', isbn: '9781977841438')
     persisted_data = persisted_data(table: 'the_book_lounge', id: book.id)
     expect(book).to be_a Book
     expect(book.id).to eq persisted_data.first['id'] 
     expect(book.author).to eq 'Mary Shelley' 
   end
  end 

  describe '.all' do
    it 'shows all of the books' do
      connection = PG.connect(dbname: 'the_book_lounge_test')  
      book = Book.create_entry(title: 'Frankenstein', author: 'Mary Shelley', genre: 'gothic', isbn: '9781977841438')
      Book.create_entry(title: 'Business for Beginners', author: 'Lara Bryan', genre: 'non-fiction', isbn: '9781474940139') 
      books = Book.all 
      expect(book).to be_a Book
      expect(book.author).to eq "Mary Shelley"
      expect(book.title).to eq "Frankenstein"
      expect(book.genre).to eq "gothic" 
      expect(book.isbn).to eq "9781977841438"
    end
  end

  describe '.delete' do
    it 'deletes a book' do
      book = Book.create_entry(title: 'Frankenstein', author: 'Mary Shelley', genre: 'gothic', isbn: '9781977841438')
      Book.create_entry(title: 'Business for Beginners', author: 'Laura Bryan', genre: 'non-fiction', isbn: '9781474940139')
      Book.delete(id: book.id)
      expect(book.title).not_to eq('Business for Beginners')
    end 
  end

 

end 