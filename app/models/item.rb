require 'date'

class Item < ActiveRecord::Base
  belongs_to :prototype
  belongs_to :pantry

  validates :pantry_id, :prototype_id, presence: true

  before_create :set_expiration_date, if: -> { self.expiration_date.blank? }
  after_create :set_prototype_shelf_life, if: -> { self.prototype.shelf_life.blank? }
  before_update :set_expiration_date, if: -> {self.expiration_date.blank? }

  def prototype_name=(prototype_name)
    self.prototype = Prototype.find_or_create_by(name: prototype_name)
  end

  def set_prototype_shelf_life
    self.prototype.update_attributes(shelf_life: (((self.expiration_date.to_time - Time.now)/3600)/24).round )
  end

  def prototype_name
    self.prototype.name if self.prototype
  end

  def set_expiration_date
    self.expiration_date = Time.now + (self.prototype.shelf_life).days
  end

  def days_remaining
    return (self.prototype.shelf_life - (((Time.now - self.created_at)/3600)/24) ).round
  end
end
