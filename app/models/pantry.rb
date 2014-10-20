class Pantry < ActiveRecord::Base
  has_many :pantry_participations
  has_many :users, through: :pantry_participations
  has_many :participants, through: :pantry_participations
  belongs_to :creator, class_name: "User"
  has_many :items

  validates :creator_id, :name, presence: true

  def item_names
  	items.order(:expiration_date).map{|i| i.prototype.name}
  end

  def search(query)
    item_names = self.items.map {|item| item.prototype.name}
    item_names.include?(query)
  end

  def item_checker(threshold)
    funky_items = []
    self.items.each do |item|
      if item.funky_or_fresh?(threshold)
        funky_items << item
      end
    end
    funky_items
  end
end
