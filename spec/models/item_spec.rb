require 'spec_helper'

describe Item do
  let(:item) { Item.new }
  context 'validations' do
    it "should have a name" do
      expect(item).to have_db_column :name
      expect(item).to have_db_column :location
      expect(item).to have_db_column :expiration_date
      expect(item).to have_db_column :pantry_id
      expect(item).to have_db_column :prototype_id
    end
  end

  it 'should validate presence of name' do
      expect(item).to validate_presence_of :name
  end

  it 'should validate presence of location' do
      expect(item).to validate_presence_of :location
  end

  it 'should validate presence of expiration date' do
      expect(item).to validate_presence_of :expiration_date
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
