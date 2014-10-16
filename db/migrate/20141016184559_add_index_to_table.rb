class AddIndexToTable < ActiveRecord::Migration
  def change
    add_index :items, :pantry_id
    add_index :items, :prototype_id
    add_index :pantries, :creator_id
    add_index :pantry_participations, :user_id
    add_index :pantry_participations, :pantry_id
  end
end
