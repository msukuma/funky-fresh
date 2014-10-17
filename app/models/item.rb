class Item < ActiveRecord::Base
  belongs_to :prototype
  belongs_to :pantry

  validates :name, :location, :expiration_date, presence: true

  before_save do
    proto_item = Prototype.find_by_name("#{self.name}")

    if proto_item
	    expires_on(proto_item.shelf_life)
	  else
	  	new_proto = Prototype.create!(name: self.name, shelf_life: self.expiration_date)
	  	self.prototype_id = new_proto.id
	  	# new_proto.items.create(name: self.name, expiration_date: expires_on(new_proto.shelf_life) )
	  end
  end

  def expires_on(days)
  	self.expiration_date = Time.now + days.day
  end
end
