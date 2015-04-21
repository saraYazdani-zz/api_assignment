class Activity < ActiveRecord::Base

  has_many :availabilities
  
  validates :title,       presence: true
  validates :description, presence: true
  validates :price,       numericality: { only_integer: true, greater_than_or_equal_to: 0, presence: true }
  validates :currency,    presence: true
  validates :city,        presence: true
  validates :country,     presence: true
  validates :is_active,   inclusion: { in: [true, false] }

end
