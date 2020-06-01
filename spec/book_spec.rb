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

  describe '.edit' do
    it 'updates a book record' do
      book = Book.create_entry(title: 'Frankenstein', author: 'Mary Shelley', genre: 'Gothic', isbn: '9781847493507')
      edited_book = Book.edit(id: book.id, title: 'The Princess Diaries', author: 'Meg Cabot', genre: 'humour', isbn: '9780330482059')
      expect(edited_book.title).to eq 'The Princess Diaries'
      expect(edited_book.author).to eq 'Meg Cabot'    
    end
  end

  describe '.find' do
    it 'finds a book by its id' do
      book = Book.create_entry(title: 'The Princess Diaries', author: 'Meg Cabot', genre: 'humour', isbn: '9780330482059')
      result = Book.find(id: book.id)
      expect(result.title).to eq 'The Princess Diaries'
      expect(result.genre).to eq 'humour'
    end
  end 


 

end 