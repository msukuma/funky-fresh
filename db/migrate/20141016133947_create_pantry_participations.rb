class CreatePantryParticipations < ActiveRecord::Migration
  def change
    create_table :pantry_participations do |t|
      t.integer :user_id
      t.integer :pantry_id

      t.index [:user_id, :pantry_id], unique: true

      t.timestamps
    end
  end
end
