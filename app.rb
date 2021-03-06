require 'sinatra/base'
require './setup_database_environment_dependent'
require './lib/book'
require './lib/user'
require './lib/review'
require 'pg'
require 'sinatra/flash'
require 'bcrypt'


class TheBookLounge < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash 
  enable :sessions

  get '/' do
    erb(:"home/index")
  end

  post '/books/add' do
    Book.create_entry(params[:title], params[:author], params[:genre], params[:isbn])
    redirect to '/books'
  end

  get '/books' do
    @books = Book.all 
    erb(:"books/index")
  end


  delete '/books/:id' do
    Book.delete(id: params[:id])
    redirect '/books'
  end

  get '/books/:id/update' do
    @book = Book.find(params[:id])
    erb(:"books/edit_book")
  end

  patch '/books/:id' do
    Book.edit(id: params[:id], title: params[:title], author: params[:author], genre: params[:genre], isbn: params[:isbn])
    flash[:notice] = 'Book record was updated!'
    redirect('/books')
  end

  get './books/:id/reviews/new' do
    @book_id = params[:id]
    erb(:'reviews/new')
  end

  post '/books/:id/reviews' do
    Review.create(text: params[:review], book_id: params[:id])
    redirect '/books'
  end 

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    session[:user_name] = user.name
    flash[:success] = 'You have successfully signed up for The Book Lounge'
    redirect to '/books'
  end

  get '/users/new' do 
    erb(:"users/new")
  end 

  get '/sessions/new' do
    erb(:"sessions/new")
  end 


  post '/sessions' do
    user = User.authenticate(name: params[:name], email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/books')
      flash[:success] = "Welcome to The Book Lounge, #{user.email}"
    else
      flash[:notice] = 'Incorrect login information. Please try again.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have logged out of The Book Lounge!'
    redirect '/'
  end 


  run if app_file == $0

end 