require 'spec_helper'

describe Pantry do
  context 'validations' do
  end

  context 'associations' do
    it { should have_many(:pantry_participations) }
    it { should have_many(:participants) }
    it { should belong_to(:creator) }
    it { should have_many(:items) }
  end
end
