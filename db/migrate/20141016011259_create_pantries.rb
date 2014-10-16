class CreatePantries < ActiveRecord::Migration
  def change
    create_table :pantries do |t|
    	t.string :name
      t.references :creator_id, index: true

      t.timestamps
    end
  end
end
