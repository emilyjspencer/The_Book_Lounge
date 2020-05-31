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
    erb(:"home/index")
  end

  post '/books/add' do
    Book.create_entry(title: params[:title2], author: params[:author2], genre: params[:genre2], isbn: params[:isbn2])
    redirect to '/books'
  end

  get '/books' do
    @books = Book.all 
    erb(:"books/index")
  end
  

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.user_id
    session[:user_name] = user.user_name
    flash[:success] = 'You have successfully signed up for The Book Lounge'
    redirect to '/books'
  end

  get '/users/new' do 
    erb(:"users/new")
  end 

  get '/sessions/new' do
    erb(:"users/new")
  end 

  post '/sessions' do
    redirect to '/books'
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = You have logged out of The Book Lounge!
    redirect '/'
  end 


  run if app_file == $0

end 