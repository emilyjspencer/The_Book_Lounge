feature 'Authentication' do
    scenario 'Successful log in' do
      User.create(name: 'emily', email: 'emily@example.com', password: 'password')
      visit '/sessions/new'
      fill_in :email, with: 'emily@example.com'
      fill_in :password, with: 'password'
      click_button('Log in')
      expect(page).to have_content 'New Books We Love'
    end
  end