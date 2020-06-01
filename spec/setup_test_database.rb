require 'pg'

 def setup_test_database

   p "Setting up test database........"

   connection = PG.connect(dbname: 'the_book_lounge_test') 

   connection.exec("TRUNCATE the_book_lounge, reviews, users") 
 end