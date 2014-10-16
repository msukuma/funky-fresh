class Pantry < ActiveRecord::Base
  has_many :pantry_participations
  has_many :participants, through: :pantry_participations, source: :user
  belongs_to :creator, class_name: "User"
  has_many :items

  validates :creator_id, presence: true
end
