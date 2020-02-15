require 'pg'
require_relative 'book'

class User

attr_reader :uid, :name, :email, :password, :phone

  def initialize(db_row)
    @uid = db_row['uid']
    @name = db_row['name']
    @email = db_row['email']
    @password = db_row['password']
    @phone = db_row['phone']
  end

  


end 