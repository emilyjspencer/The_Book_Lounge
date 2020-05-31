require_relative 'database_connection' 

class Book
  attr_reader :title, :author, :genre, :isbn, :id

  def initialize(title:, author:, genre:, isbn:, id:)
    @title = title
    @author = author
    @genre = genre
    @isbn = isbn
    @id = id
  end 

  
  def self.create_entry(title:, author:, genre:, isbn: )
    result = DatabaseConnection.query("INSERT INTO the_book_lounge (title, author, genre, isbn) VALUES('#{title}', '#{author}', '#{genre}', '#{isbn}') RETURNING id, title, author, genre, isbn;")
    Book.new(id: result[0]['id'], 
    title: result[0]['title'], 
    author: result[0]['author'], 
    genre: result[0]['genre'], 
    isbn: result[0]['isbn'])
  end 

  def self.all 
    result = DatabaseConnection.query("SELECT * FROM the_book_lounge;") 
    result.map do |book|
      Book.new(id: book['id'], title: book['title'], author: book['author'], genre: book['genre'], isbn: book['isbn'])
    end
  end

  def self.delete_book_by_title(title: )
    result = DatabaseConnection.query("DELETE * FROM books WHERE title = '#{title}'") 
  end 

  def self.delete_book_by_isbn(isbn: )
    result = DatabaseConnection.query("DELETE * FROM books WHERE isbn = '#{isbn}'")
  end 

  

  def self.find_by_isbn(isbn)
    result = DatabaseConnection.query("SELECT * FROM books WHERE isbn = '#{isbn}'")
    Book.new(result[0]['id'], result[0]['title'], result[0]['author'], result[0]['genre'], result[0]['isbn'])
  end

  def self.find_by_title(title)
    result = DatabaseConnection.query("SELECT * FROM books WHERE title = '#{title}'")
  end 

  def self.find_by_author(author)
    result = DatabaseConnection.query("SELECT * FROM books WHERE author ='#{author}'")
  end 

  def self.find_by_genre(genre)
    result = DatabaseConnection.query("SELECT * FROM books WHERE genre = '#{genre}'")
  end 

  


end 