class CreatePantryParticipations < ActiveRecord::Migration
  def change
    create_table :pantry_participations do |t|
      t.references :user_id, index: true
      t.references :pantry_id, index: true

      t.timestamps
    end
  end
end
