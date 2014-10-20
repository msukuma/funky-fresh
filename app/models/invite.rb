class Invite < ActiveRecord::Base
  belongs_to :pantry
  belongs_to :sender, :class_name => "User"
  belongs_to :recipient, :class_name => "User"

  before_save :check_user_existence
  
  before_create :generate_token

  def generate_token
     self.token = Digest::SHA1.hexdigest([self.pantry_id, Time.now, rand].join)
  end

  def check_user_existence
    recipient = User.find_by_email(email)
    if recipient
      self.recipient_id = recipient.id
    end
  end


end
