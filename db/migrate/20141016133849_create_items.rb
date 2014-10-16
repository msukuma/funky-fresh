class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :location, :default => "The Cookie Jar"
      t.date :expiration_date, :default => Time.now
      t.references :pantry, index: true
      t.references :prototype, index: true

      t.timestamps
    end
  end
end
