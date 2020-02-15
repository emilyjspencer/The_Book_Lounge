require 'pg'
require_relative 'book'

class User

attr_reader :uid, :name, :email, :password, :phone_number

  def initialize(db_row)
    @uid = db_row['uid']
    @name = db_row['name']
    @email = db_row['email']
    @password = db_row['password']
    @phone_number = db_row['phone_number']
  end

  def self.create(name:, email:, password:, phone_number:)
    return false unless is_email?(email)
    result = DatabaseConnection.query("INSERT INTO users (name, email, password, phone_number) VALUES ('#{name}', '#{email}', '#{password}', '#{phone_number}')")
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users").map { |row| User.new(row) }
  end

  private 

  def self.is_email?(email)
    email =~ URI::MailTo::EMAIL_REGEXP
  end

  


end 