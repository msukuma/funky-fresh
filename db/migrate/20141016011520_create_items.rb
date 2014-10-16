class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :location, :default => "The Cookie Jar"
      t.date :expiration_date #set default expiration date
      t.references :pantry_id, index: true
      t.references :prototype_id, index: true

      t.timestamps
    end
  end
end
