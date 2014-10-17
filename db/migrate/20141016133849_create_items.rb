class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.date :expiration_date
      t.integer :pantry_id
      t.integer :prototype_id

      t.timestamps
    end
  end
end
