require 'spec_helper'

describe User do
  let(:user) { User.create(first_name: "Ada", last_name: "Lovelace", email: "ada@gmail.com", password: "programingrocks1")}
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
      user = User.create(:email => "susan@")
      expect(user.errors[:email][0]).to eq("is invalid")
    end

    it 'should validate presence of password' do
      expect(user).to validate_presence_of :password_digest
    end

    it "should require a valid password" do
      user = User.create(:password => "susa")
      expect(user.errors[:password][0]).to eq("is too short (minimum is 6 characters)")
    end
  end

  context 'associations' do
    it { should have_many(:pantry_participations) }
    it { should have_many(:pantries) }
    it { should have_many(:original_pantries) }
  end
end
