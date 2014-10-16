require 'spec_helper'

describe PantryParticipation do
  let(:pantry_participation) { PantryParticipation.new }

  context 'validations' do
    it "should have user id and pantry id" do
      expect(pantry_participation).to have_db_column :user_id
      expect(pantry_participation).to have_db_column :pantry_id
    end
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:pantry) }
  end
end
