require 'spec_helper'

describe User do
  let(:user){User.new(first_name: "Clark", last_name: "Kent", email: "ck@gmail.com")}
  context 'validations' do
    it "should have first_name, last_name, email and password columns" do
      expect(user).to have_db_column :first_name
      expect(user).to have_db_column :last_name
      expect(user).to have_db_column :email
      user.password = "superman"
      user.save
      expect(user).to have_db_column :password_digest
    end


    it 'should validate presence of email' do
      expect(user).to validate_presence_of :email
    end

    it 'should have a unique email address' do
      expect(user).to validate_presence_of :email
    end
    # it "should require a valid email" do
    #   user = User.create(:email => "susan@")
    #   expect(user.errors[:email][0]).to eq("is invalid")
    # end

    # it "should require a valid password" do
    #   user = User.create(:password => "susa")
    #   expect(user.errors[:password][0]).to eq("is too short (minimum is 5 characters)")
    # end


  end

  context 'associations' do
    it { should have_many(:pantry_participations) }
    it { should have_many(:pantries)}
  end
end


validates_presence_of
