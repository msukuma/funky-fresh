# require 'spec_helper'

# describe Pantry do
#   let(:pantry) { Pantry.new }
#   context 'validations' do
#     expect(pantry).to have_db_column :name
#     expect(pantry).to have_db_column :creator_id
#   end

#   it 'should validate presence of name' do
#     expect(pantry).to validate_presence_of :name
#   end

#   it 'should validate presence of location' do
#     expect(pantry).to validate_presence_of :creator_id
#   end

#   context 'associations' do
#     it { should have_many(:pantry_participations) }
#     it { should have_many(:participants) }
#     it { should belong_to(:creator) }
#     it { should have_many(:items) }
#   end
# end
