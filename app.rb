require 'sinatra/base'
require './setup_database_environment_dependent'
require 'pg'


class TheBookLounge < Sinatra::Base
  
  enable :sessions

  get '/' do
    erb(:index)
  end

  


  run if app_file == $0

end 