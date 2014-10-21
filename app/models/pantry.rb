class Pantry < ActiveRecord::Base
  has_many :pantry_participations
  
  has_many :users, through: :pantry_participations
  
  belongs_to :creator, class_name: "User"
  
  has_many :items, dependent: :destroy

  has_many :invites

  validates :creator_id, :name, presence: true

  def item_names
    hash = {}
  	array = items.order(:expiration_date).map{|item| [item.prototype.name, item.prototype.plural]}.flatten
    array.each { |name| hash[name] = true }
    hash
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
