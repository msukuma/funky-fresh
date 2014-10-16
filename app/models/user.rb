class User < ActiveRecord::Base
  has_many :pantry_participations
  has_many :pantries, through: :pantry_participations
  has_many :original_pantries, foreign_key: :creator_id, class_name: "Pantry"

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, on: :create }
  validates :password, :length => {:minimum => 6}

  has_secure_password
end
