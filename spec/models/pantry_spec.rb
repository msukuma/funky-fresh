require 'spec_helper'

describe Pantry do
  let(:pantry) { Pantry.new }
  context 'validations' do
    it "should have a name and creator id" do
      expect(pantry).to have_db_column :name
      expect(pantry).to have_db_column :creator_id
    end
  end

  it 'should validate presence of name' do
    expect(pantry).to validate_presence_of :name
  end

  it 'should validate presence of location' do
    expect(pantry).to validate_presence_of :creator_id
  end

  context 'associations' do
    it { should have_many(:pantry_participations) }
    it { should have_many(:users) }
    it { should belong_to(:creator) }
    it { should have_many(:items) }
  end
end
