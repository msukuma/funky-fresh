class Prototype < ActiveRecord::Base
  has_many :items

  # validates :name, :shelf_life, presence: true

end
