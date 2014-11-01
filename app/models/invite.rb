class Invite < ActiveRecord::Base
  belongs_to :pantry
  belongs_to :sender, :class_name => "User"
  belongs_to :recipient, :class_name => "User"

  validates :email, presence: true
  validates :pantry, presence: true
  validates :sender, presence: true
  validates :token, presence: true

  before_save :generate_token, :check_user_existence

  def generate_token
     self.token = Digest::SHA1.hexdigest([self.pantry_id, Time.now, rand].join)
  end

  def check_user_existence
    recipient = User.find_by_email(email)
    if recipient
      self.recipient_id = recipient.id
    end
  end

  def is_a_user?
    !!User.find_by_email(self.email)
  end

  def invite_sort_n_send(recipient)
    pantry = Pantry.find_by_id(self.pantry_id)
    if self.is_a_user? && recipient.has_pantry?(pantry)
    elsif self.is_a_user? && !recipient.has_pantry?(@pantry)
      InviteMailer.existing_user_invite(self).deliver
      self.recipient.pantries.push(self.pantry)
    else
      InviteMailer.new_user_invite(self, 'http://localhost:3000' + Rails.application.routes.url_helpers.new_user_path(:invite_token => self.token)).deliver
    end
  end

end

