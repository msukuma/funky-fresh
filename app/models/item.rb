class Item < ActiveRecord::Base
  belongs_to :prototype
  belongs_to :pantry

  validates :name, :location, :expiration_date, :pantry_id, :prototype_id, presence: true
end
