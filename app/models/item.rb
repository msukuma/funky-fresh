class Item < ActiveRecord::Base
  belongs_to :prototype
  belongs_to :pantry

  validates :pantry_id, :prototype_id, presence: true

  before_create :set_expiration_date, if: -> { self.expiration_date.blank? }

  def prototype_name=(prototype_name)
    self.prototype = Prototype.find_or_create_by(name: prototype_name, )
  end

  def prototype_name
    self.prototype.name if self.prototype
  end

  def set_expiration_date
    # self.expiration_date = self.prototype.expiration_date.days_from_now
    self.expiration_date = Time.now + self.prototype.shelf_life.days
  end

  def days_remaining
    return (self.prototype.shelf_life - (((Time.now - self.created_at)/3600)/24) ).round
  end
end
