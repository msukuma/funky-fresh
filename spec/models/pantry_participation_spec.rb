require 'spec_helper'

describe PantryParticipation do
  let(:pantry_participation) { PantryParticipation.new }
  context 'validations' do
    expect(pantry_participation).to have_db_column :user_id
    expect(pantry_participation).to have_db_column :pantry_id
  end

  it 'should validate presence of name' do
      expect(pantry_participation).to validate_presence_of :user_id
  end

  it 'should validate presence of location' do
      expect(pantry_participation).to validate_presence_of :pantry_id
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:pantry) }
  end
end
