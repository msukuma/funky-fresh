class Prototype < ActiveRecord::Base
  has_many :items

  validates :name, presence: true

  # validates :name, :shelf_life, presence: true

end
