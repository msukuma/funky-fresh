require 'spec_helper'

describe Prototype do
  let(:prototype) { Prototype.new }
  context 'validations' do
    it "should have a name" do
      expect(prototype).to have_db_column :name
    end
  end

  it 'should validate presence of name' do
    expect(prototype).to validate_presence_of :name
  end

  context 'associations' do
    it { should have_many(:items) }
  end
end
