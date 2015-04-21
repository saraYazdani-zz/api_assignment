class Availability < ActiveRecord::Base

  # attr_accessible :activity_id, :starts_at, :price, :currency

  belongs_to :activity

  validates :activity_id, numericality:  {only_integer: true}
  validates :starts_at,   presence:      true
  validates :price,       numericality:  {only_integer: true, greater_than_or_equal_to: 0}
  validates :currency,    presence:      true

# def same_currency
#   if :currency == :activity.currency
#   retuen true
# end

end
