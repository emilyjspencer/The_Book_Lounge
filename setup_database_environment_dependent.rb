require './lib/database_connection'

 if ENV['ENVIRONMENT'] == 'test'
   DatabaseConnection.establish_connection('the_book_lounge_test') 
 else
   DatabaseConnection.establish_connection('the_book_lounge') 
 end 