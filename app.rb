require 'sinatra/base'
require './setup_database_environment_dependent'
require './lib/book'
require './lib/user'
require 'pg'
require 'sinatra/flash'
require 'bcrypt'


class TheBookLounge < Sinatra::Base

  register Sinatra::Flash 
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
    erb(:booksaddedtodb)
  end

  
  post '/booksadded' do
    Book.create_entry(title: params[:title2], author: params[:author2], genre: params[:genre2], isbn: params[:isbn2])
       redirect '/booksaddedtodb'
  end

  post '/allbooks' do
    redirect '/allbooks'
  end

  get '/allbooks' do
    @books = Book.all
    erb(:allbooks)
  end

  post '/searchbooks' do
    "Hello World"
  end
  
  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    user = User.create(name: params[:name], email: params[:email], phone_number: params[:phone_number], password: params[:password])
    session[:user_id] = user.user_id
    session[:user_name] = user.user_name
    redirect to '/signedup'
  end

  get '/login' do
    erb(:login)
  end 



  post '/login' do
    flash[:notice] = "You have loggied in to The Book Lounge"
    redirect to '/'
  end

  get '/logout' do
    erb(:logout)
  end


  run if app_file == $0

end 