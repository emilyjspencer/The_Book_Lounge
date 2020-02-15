require 'user'

describe User do 
  let(:subject) { described_class.new({'uid' => '1', 
                                      'name' => 'Millie Moo', 
                                      'email' => 'milliemoo@gmail.com', 
                                      'password' => 'mils',
                                      'phone' => '012345'}) 
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
      expect(subject.phone).to eq '012345'
    end
  end

  
  
  

 
end