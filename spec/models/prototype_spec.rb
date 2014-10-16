require 'spec_helper'

describe Prototype do
  let(:prototype) { Prototype.new }
  context 'validations' do
    it "should have a name and shelf life" do
      expect(prototype).to have_db_column :name
      expect(prototype).to have_db_column :shelf_life
    end
  end

  it 'should validate presence of name' do
    expect(prototype).to validate_presence_of :name
  end

  it 'should validate presence of location' do
    expect(prototype).to validate_presence_of :shelf_life
  end

  context 'associations' do
    it { should have_many(:items) }
  end
end
