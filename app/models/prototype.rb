class Prototype < ActiveRecord::Base
  has_many :items

  validates :name, presence: true, uniqueness: true

  # validates :name, :shelf_life, presence: true

end
