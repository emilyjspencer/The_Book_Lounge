require_relative 'database_connection'

class Review
  attr_reader :id, :text, :book_id

  def initialize(id:, text:, book_id:)
    @id = id
    @text = text
    @book_id = book_id
  end

  def self.create(book_id:, text:)
    result = DatabaseConnection.query("INSERT INTO reviews (book_id, text) VALUES ('#{book_id}', '#{text}') RETURNING id, text, book_id;")
    Review.new(id: result[0]['id'], text: result[0]['text'], book_id: result[0]['book_id'])
  end 

  def self.find(book_id:)
    result = DatabaseConnection.query("SELECT * FROM reviews WHERE book_id = #{book_id};")
    result.map do |review|
      Review.new(id: review['id'], text: review['text'], book_id: review['book_id'])
    end 
end 
end 