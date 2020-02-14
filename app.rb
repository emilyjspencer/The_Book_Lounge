require 'sinatra/base'
require './setup_database_environment_dependent'
require 'pg'


class TheBookLounge < Sinatra::Base
  
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/' do
    Book.create_entry(title: params[:title2], author: params[:author2], genre: params[:genre2], isbn: params[:isbn2])
    redirect  '/booksaddedtodb'
  end

  get '/booksaddedtodb' do
    @books = Book.all 
    erb(:booksadded)
  end

  post '/booksadded' do
    "Hello World"
  end

  


  run if app_file == $0

end 