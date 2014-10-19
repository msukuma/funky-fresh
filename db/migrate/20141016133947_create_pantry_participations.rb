class CreatePantryParticipations < ActiveRecord::Migration
  def change
    create_table :pantry_participations do |t|
      t.integer :user_id
      t.integer :pantry_id

      t.timestamps
    end
  end
end
