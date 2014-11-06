require 'spec_helper'

describe User do
  let(:user) { User.create(first_name: "ada", last_name: "lovelace", email: "ADA@GMAIL.COM", password: "programingrocks1")}
  let(:temp_user1) { User.create(first_name: "Joe", last_name: "Montana", email: "jmontana@gmail.com", password: "lovemontana")}
  let(:temp_user2) { User.create(first_name: "Bob", last_name: "Marley", email: "bmarley@gmail.com", password: "password")}
  let(:pantry3) { Pantry.create(name: "Bob's Kitchen", creator_id: temp_user2.id) }

   context 'schema' do 
    it { should have_db_column(:first_name).of_type :string }
    it { should have_db_column(:last_name).of_type :string }
    it { should have_db_column(:email).of_type :string }
    it { should have_db_column(:password_digest).of_type :string }
   end

  context 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password_digest }
    
    it 'should have a unique email address' do
      expect(user).to validate_uniqueness_of :email
    end
  
    it "should require a valid email" do
      test_user = User.create(:email => "susan@")
      expect(test_user.errors[:email][0]).to eq("is invalid")
    end


    it "should require a valid password" do
      test_user = User.create(:password => "susa")
      expect(test_user.errors[:password][0]).to eq("is too short (minimum is 6 characters)")
    end
  end

  context 'associations' do
    it { should have_many(:pantry_participations) }
    it { should have_many(:pantries) }
    it { should have_many(:original_pantries) }
  end

  context 'methods' do
    describe 'capitalize_first_n_last_name' do
      it "should capitalize a user's first and last name" do
        user.capitalize_first_n_last_name 
        expect(user.first_name).to eq 'Ada'
        expect(user.last_name).to eq 'Lovelace'
      end
    end

    describe 'lowercase_email' do
      it "should make all letters in a user's email address into lowercase letters" do
        user.lowercase_email
        expect(user.email).to eq 'ada@gmail.com'
      end
    end

    describe 'all_pantries' do
      it "should combine all of user's pantries into one array" do
        pantry1 = Pantry.new(name: "Joe's First Kitchen", creator_id: temp_user1.id)
        pantry2 = Pantry.new(name: "Joe's Second Kitchen", creator_id: temp_user1.id)
  
        PantryParticipation.create(user_id: temp_user1.id, pantry_id: pantry3.id)
  
        temp_user1.original_pantries << pantry1
        temp_user1.original_pantries << pantry2
        expect(temp_user1.all_pantries.count).to eq 3
      end
    end

    describe 'has_pantry?' do 
      it 'should check whether a user has a given pantry' do 
        expect(temp_user2.has_pantry?(pantry3)).to eq true
      end
    end
  end
end
