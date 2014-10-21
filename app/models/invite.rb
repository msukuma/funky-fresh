class Invite < ActiveRecord::Base
  belongs_to :pantry
  belongs_to :sender, :class_name => "User"
  belongs_to :recipient, :class_name => "User"

  validates :email, :pantry, presence: true

  before_save :generate_token, :check_user_existence

def generate_token
  puts "generating token !~~~~~~~~~~~~~~~~"
   self.token = Digest::SHA1.hexdigest([self.pantry_id, Time.now, rand].join)
end

  def check_user_existence
    recipient = User.find_by_email(email)
    if recipient
      self.recipient_id = recipient.id
    end
  end


end

