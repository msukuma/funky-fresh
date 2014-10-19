class Pantry < ActiveRecord::Base
  has_many :pantry_participations
  has_many :users, through: :pantry_participations
  has_many :participants, through: :pantry_participations
  belongs_to :creator, class_name: "User"
  has_many :items

  validates :creator_id, :name, presence: true
  def recent_item_names_as_hash
  	hash = {}
  	items.order(:expiration_date).map{|i| i.prototype.name}.each{|name| hash[name]= true}
  	hash
  end
end
