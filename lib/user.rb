require 'pg'
require_relative 'book'
require 'bcrypt'
require './lib/database_connection'

class User

attr_reader :id, :name, :email, :password 

  def initialize(id:, name:, email: )
    @id = id
    @name = name
    @email = email
  end


  def self.create(name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES('#{name}', '#{email}', '#{encrypted_password}') RETURNING id, name, email;")
    User.new(
      id: result[0]['id'], 
      name: result[0]['name'], 
      email: result[0]['email']
    )
  end

  def self.authenticate(name:, email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end



end 