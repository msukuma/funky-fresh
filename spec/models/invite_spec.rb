require 'spec_helper'

describe Invite do
  let(:invite) { Invite.new }
  context 'validations' do
    it "should have a name" do
      expect(invite).to have_db_column :email
      expect(invite).to have_db_column :pantry_id
      expect(invite).to have_db_column :sender_id
      expect(invite).to have_db_column :recipient_id
      expect(invite).to have_db_column :token
    end

  it 'should validate presence of email' do
      expect(invite).to validate_presence_of :email
  end

  it 'should validate presence of pantry id' do
      expect(invite).to validate_presence_of :pantry
  end

  it 'should validate presence of sender id' do
      expect(invite).to validate_presence_of :sender
  end


  it 'should validate presence of token' do
      expect(invite).to validate_presence_of :token
  end

  context 'associations' do
    it { should belong_to(:pantry) }
    it { should belong_to(:sender) }
    it { should belong_to(:recipient) }
  end
end

end
