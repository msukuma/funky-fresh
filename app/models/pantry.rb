class Pantry < ActiveRecord::Base
  has_many :pantry_participations
  has_many :users, through: :pantry_participations
  has_many :participants, through: :pantry_participations
  belongs_to :creator, class_name: "User"
  has_many :items

  validates :creator_id, :name, presence: true

  def search(query)
    item_names = self.items.map {|item| item.prototype.name}
    item_names.include?(query)
  end

end
