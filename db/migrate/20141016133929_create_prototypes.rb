class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :name
      t.string :plural
      t.integer :shelf_life


      t.timestamps
    end
  end
end
