class CreatePantries < ActiveRecord::Migration
  def change
    create_table :pantries do |t|
      t.string :name
      t.integer :creator_id

      t.timestamps
    end
  end
end
