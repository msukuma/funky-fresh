class User < ActiveRecord::Base
  has_many :pantry_participations
  has_many :pantries, through: :pantry_participations
  has_many :original_pantries, foreign_key: :creator_id, class_name: "Pantry"

  has_many :invitations, :class_name => "Invite", :foreign_key => "recipient_id"
  has_many :send_invitations, :class_name => "Invite", :foreign_key => "sender_id"

  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates :email, uniqueness: {:message => "This email has already been taken"}
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }
  validates :password, :length => {:minimum => 6}

  has_secure_password

  before_save :capitalize_first_n_last_name, :lowercase_email

  def capitalize_first_n_last_name
    self.first_name = first_name.downcase.capitalize
    self.last_name = last_name.downcase.capitalize
  end

  def lowercase_email
    self.email = email.downcase
  end

  def all_pantries
    my_pantries = []
    my_pantries << self.original_pantries.to_a
    my_pantries << self.pantries.to_a
    my_pantries.flatten
  end

  def has_pantry?(pantry)
    self.all_pantries.include?(pantry)
  end


end
