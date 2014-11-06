require 'spec_helper'

describe Item do
  let(:user) { User.create(first_name: "Joe", last_name: "Montana", email: "jmontana@gmail.com", password: "lovemontana")}
  let(:pantry) { Pantry.create(name: "Joe's Kitchen", creator_id: user.id) }
  let(:prototype) { Prototype.create(name: "milk", shelf_life: 7) }
  let(:item) { Item.create(pantry_id: pantry.id, prototype_id: prototype.id) }
  
  context 'schema' do 
    it { should have_db_column(:pantry_id).of_type(:integer)}
    it { should have_db_column(:prototype_id).of_type(:integer)}
    it { should have_db_column(:expiration_date).of_type(:date)}
  end

  context 'validations' do 
    it { should validate_presence_of :pantry_id}
    it { should validate_presence_of :prototype_id}
  end

  context 'associations' do 
    it { should belong_to :prototype}
    it { should belong_to :pantry}
  end

  context 'methods' do 
    describe 'prototype_name' do 
      it 'should be readable' do 
        expect(item.prototype_name).to eq prototype.name
      end
      
      it 'should be writable' do 
        ice_cream_cake = Item.create(prototype_name: 'ice cream cake', expiration_date: '11/20/2014')
        expect(ice_cream_cake.prototype.name).to eq 'ice cream cake'
      end
    end

    describe 'set_expiration_date' do 
      it "should calculate an item's expiration date from its prototype's shelf_life" do 
        expect(item.expiration_date).to eq (Date.today + 7.days)
      end
    end

    describe 'set_prototype_shelf_life' do 
      it 'should calculate the shelf life of a custom item' do 
        ice_cream_cake = Item.create(prototype_name: 'ice cream cake', expiration_date: Date.today + 15.days, pantry_id: pantry.id)
        expect(ice_cream_cake.prototype.shelf_life).to eq 15
      end
    end


    describe 'funky_or_fresh?' do 
      it "should return true if an item's expiration date is within the threshold" do
        expect(item.funky_or_fresh?(7)).to eq true
      end

      it "should return false if an item's expiration date is outside of the threshold" do
        expect(item.funky_or_fresh?(2)).to eq false
      end
    end

  end
  

end
