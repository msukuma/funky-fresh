class CreatePantries < ActiveRecord::Migration
  def change
    create_table :pantries do |t|
      t.string :name
      # t.references :creator, index: true

      t.timestamps
    end
  end
end
