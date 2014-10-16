require 'spec_helper'

describe PantryParticipation do
  context 'validations' do
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:pantry) }
  end
end
