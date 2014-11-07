require 'spec_helper'

describe Pantry do

  context 'schema' do 
    it { should have_db_column :name }
    it { should have_db_column :creator_id }
  end
  
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :creator_id }
  end

  context 'associations' do
    it { should have_many(:pantry_participations) }
    it { should have_many(:users) }
    it { should belong_to(:creator) }
    it { should have_many(:items) }
  end

  context 'methods' do 
    before(:each) do 
      @user = User.create(first_name: "ada", last_name: "lovelace", email: "ADA@GMAIL.COM", password: "programingrocks1")
      # @pantry = Pantry.create(name: "kitchen", creator_id: @user.id) 
      @proto1 = Prototype.create(name: "milk", plural: "milk", shelf_life: 7) 
      @proto2 = Prototype.create(name: "orange", plural: "oranges", shelf_life: 7) 
      @proto3 = Prototype.create(name: "sugar", plural: "sugar", shelf_life: 547) 
      @proto4 = Prototype.create(name: "kidney", plural: "kidneys", shelf_life: 3) 
    end
    describe 'item_names_and_plural' do 
      it 'should return an array containing the names and plurals of the top (1..3) items about to expire' do 
        item1 = Item.new(prototype_name: "milk") 
        item2 = Item.new(prototype_name: "orange") 
        item3 = Item.new(prototype_name: "sugar") 
        item4 = Item.new(prototype_name: "kidney") 
        # item1 = double("item", prototype_id: @proto1.id, pantry_id: @pantry.id)
        # item2 = double("item", prototype_id: @proto2.id, pantry_id: @pantry.id) 
        # item3 = double("item", prototype_id: @proto3.id, pantry_id: @pantry.id)
        # item4 = double("item", prototype_id: @proto4.id, pantry_id: @pantry.id)
        pantry = double("pantry"), name: "kitchen", creator_id: @user.id )
        pantry.items << [item1,item2,item3,item4]
        puts pantry.item_names_and_plural
        expect(pantry.item_names_and_plural).to eq "kidney kidneys milk orange oranges"
      end
    end

    describe 'comparators' do 

    end

    describe 'pantry_has' do 

    end

    describe 'pantry_might_have' do 

    end

    describe 'search' do 

    end

    describe 'item_checker' do 

    end
  end

end
