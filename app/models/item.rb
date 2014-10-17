class Item < ActiveRecord::Base
  belongs_to :prototype
  belongs_to :pantry

  validates :name, :location, :expiration_date, :pantry_id, :prototype_id, presence: true

  before_validation :set_expiration_date, if: -> { self.expiration_date.blank? }

  def prototype_name=(prototype_name)
    self.prototype = Prototype.find_or_create_by(name: prototype_name)
  end

  def prototype_name
    self.prototype.name if self.prototype
  end

  def set_expiration_date
    self.expiration_date = self.prototype.expiration_date.days_from_now
  end
end
