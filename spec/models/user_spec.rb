require 'spec_helper'

describe User do
  let(:user) { User.create(first_name: "ada", last_name: "lovelace", email: "ADA@GMAIL.COM", password: "programingrocks1")}
  let(:temp_user1) { User.create(first_name: "Joe", last_name: "Montana", email: "jmontana@gmail.com", password: "lovemontana")}
  let(:temp_user2) { User.create(first_name: "Bob", last_name: "Marley", email: "bmarley@gmail.com", password: "password")}
  let(:pantry1) { Pantry.create(name: "Joe's First Kitchen", creator_id: temp_user1.id) }
  let(:pantry2) { Pantry.create(name: "Joe's Second Kitchen", creator_id: temp_user1.id) }
  let(:pantry3) { Pantry.create(name: "Bob's Kitchen", creator_id: temp_user2.id) }

  context 'validations' do
    it "should have first_name, last_name, email and password columns" do
      expect(user).to have_db_column :first_name
      expect(user).to have_db_column :last_name
      expect(user).to have_db_column :email
      user.save
      expect(user).to have_db_column :password_digest
    end

    it 'should validate the presence of name' do
      expect(user).to validate_presence_of :first_name
      expect(user).to validate_presence_of :last_name
    end

    it 'should validate presence of email' do
      expect(user).to validate_presence_of :email
    end

    it 'should have a unique email address' do
      expect(user).to validate_uniqueness_of :email
    end

    it "should require a valid email" do
      test_user = User.create(:email => "susan@")
      expect(test_user.errors[:email][0]).to eq("is invalid")
    end

    it 'should validate presence of password' do
      expect(user).to validate_presence_of :password_digest
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
        p temp_user1
        p temp_user1.pantries
        p temp_user1.original_pantries
        p pantry1
        p pantry2
        p pantry3
        expect(user.all_pantries).to eq []
      end
    end
  end
end
