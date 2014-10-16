class Item < ActiveRecord::Base
  belongs_to :prototype
  belongs_to :pantry

  validates :name, presence: true
end
