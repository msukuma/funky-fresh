class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      # t.string :name
      t.date :expiration_date, :default => Time.now
      t.integer :pantry_id
      t.integer :prototype_id

      t.timestamps
    end
  end
end
