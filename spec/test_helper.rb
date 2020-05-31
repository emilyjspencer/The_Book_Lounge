
def create_user
  User.create(name: 'emily', email: 'emily@example.com', password: 'password')
end