require 'spec_helper'

describe Prototype do
  context 'validations' do
  end

  context 'associations' do
    it { should have_many(:items) }
  end
end
