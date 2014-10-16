class Item < ActiveRecord::Base
  belongs_to :prototype
  belongs_to :pantry

  validates :name, :location, :expiration_date, :pantry_id, :prototype_id, presence: true

  before_save do
    proto_item = Prototype.find_by_name("#{self.name}").shelf_life
    puts proto_item

    self.expiration_date = Time.now + (proto_item).day
  end

end
