require 'user'

describe User do 


  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Emily', email: 'emily@example.com', password: 'password')
      persisted_data = persisted_data(table: :users, id: user.id)
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id'] 
      expect(user.email).to eq 'emily@example.com' 
    end

    it 'hashes the password using the BCrypt gem' do
      expect(BCrypt::Password).to receive(:create).with('password')
      User.create(name: 'Emily', email: 'emily@example.com', password: 'password')
    end
  end 

  describe '.authenticate' do
    it 'returns a user given a correct username and password' do
      user = User.create(name: 'emily', email: 'emily@example.com', password: 'password')
      authenticated_user = User.authenticate(name: 'emily', email: 'emily@example.com', password: 'password')
      expect(authenticated_user.password).to eq user.password
    end
  end
  

 
  
  

 
end