require 'spec_helper'

describe Item do
  context 'validations' do

  end

  context 'associations' do
    it { should belong_to(:prototype) }
    it { should belong_to(:pantry) }
  end
end
