require 'review'
require 'book'
require 'database_helpers'

describe Review do
  describe '.create' do
    it 'creates a review' do
      book = Book.create_entry(title: 'Frankenstein', author: 'Mary Shelley', genre: 'gothic', isbn: '9781847493507')
      review = Review.create(text: 'This is a brilliant book!', book_id: book.id)
      persisted_data = persisted_data(id: review.id, table: 'reviews')
      expect(review).to be_a Review
      expect(review.id).to eq persisted_data.first['id']
      expect(review.text).to eq 'This is a brilliant book!'
      expect(review.book_id).to eq book.id
    end
  end

    describe '.find'  do
      it 'finds the review by its id' do
        book = Book.create_entry(title: 'Frankenstein', author: 'Mary Shelley', genre: 'gothic', isbn: '9781847493507')
        review = Review.create(text: 'Great', book_id: book.id)
        reviews = Review.find(book_id: book.id)
        reviews = reviews.first
        persisted_data = persisted_data(table:'reviews', id: review.id)
        expect(review.id).to eq persisted_data.first['id']
        expect(review.text).to eq 'Great'
        expect(review.book_id).to eq book.id
      end 
    end
end 