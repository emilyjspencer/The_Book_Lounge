require 'user'

describe User do 
  let(:subject) { described_class.new({'uid' => '1', 
                                      'name' => 'Millie Moo', 
                                      'email' => 'milliemoo@gmail.com', 
                                      'password' => 'mils',
                                      'phone_number' => '012345'}) 
  }
  let(:subject_2) { User }

  describe '#initialization' do
    it 'initializes with a uid' do
      expect(subject.uid).to eq '1'
    end
    it 'initializes with a name' do
      expect(subject.name).to eq 'Millie Moo'
    end
    it 'initializes with an email address' do
      expect(subject.email).to eq 'milliemoo@gmail.com'
    end
    it 'initializes with a password' do
      expect(subject.password).to eq 'mils'
    end
    it 'initializes with a phone number' do
      expect(subject.phone_number).to eq '012345'
    end
  end

  describe '.create' do
    it 'creates a new user' do
      subject_2.create(name: 'Jacob R M',
                       email: 'Jakeythevictorian@gmail.com',
                       password: 'ilovetophats',
                       phone_number: '0123456')
      expect(subject_2.all.last.name).to eq 'Jacob R M'
    end
  end 

  describe '.all' do
    it 'returns an array' do
      expect(subject_2.all).to be_a Array
    end
    it 'has an instance of the User class' do
      expect(subject_2.all.last).to be_a User
    end
    it 'initializes correctly' do
      expect(subject_2.all.last.name).to eq 'Jacob R M'
    end
  end
  
  

 
end