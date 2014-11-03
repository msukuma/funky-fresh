require 'spec_helper'

describe Item do
  let(:user) { User.create(first_name: "Joe", last_name: "Montana", email: "jmontana@gmail.com", password: "lovemontana")}
  let(:pantry) { Pantry.create(name: "Joe's Kitchen", creator_id: user.id)  }
  let(:prototype) { Prototype.create(name: "milk", shelf_life: 7) }
  let(:item) { Item.create(expiration_date: Time.now, pantry_id: pantry.id, prototype_id: prototype.id) }
  
  context 'validations' do
    it "should have a name" do
      expect(item).to have_db_column :expiration_date
      expect(item).to have_db_column :pantry_id
      expect(item).to have_db_column :prototype_id
    end
  end

  it 'should validate presence of pantry id' do
      expect(item).to validate_presence_of :pantry_id
  end

  it 'should validate presence of prototype id' do
      expect(item).to validate_presence_of :prototype_id
  end

  context 'associations' do
    it { should belong_to(:prototype) }
    it { should belong_to(:pantry) }
  end
  

end
