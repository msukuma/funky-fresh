class CreatePantryParticipations < ActiveRecord::Migration
  def change
    create_table :pantry_participations do |t|
      t.references :user, index: true
      t.references :pantry, index: true

      # t.integer :user_id
      # add_index :pantry_participations, :user_id

      t.timestamps
    end
  end
end
