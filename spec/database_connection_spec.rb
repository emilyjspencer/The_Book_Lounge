require 'database_connection'

 describe DatabaseConnection do

  
   describe '.establish_connection' do 
     it 'sets up a connection to a database using PG' do
       expect(PG).to receive(:connect).with(dbname: 'the_book_lounge_test') # connect to the test database 
       DatabaseConnection.establish_connection('the_book_lounge_test') 
     end
   end

   describe '.query' do 
     it 'queries the database using PG' do
       connection = DatabaseConnection.establish_connection('the_book_lounge_test') 
       expect(connection).to receive(:exec).with("SELECT * FROM the_book_lounge;") 
       DatabaseConnection.query("SELECT * FROM the_book_lounge;") 
     end   
   end

 end