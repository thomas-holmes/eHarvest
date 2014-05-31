class Item < ActiveRecord::Base
  belongs_to :item_code
  has_many :order_items


  before_save :to_lower

  def to_lower
    self.name = self.name.downcase
  end
  # This should be done by the database as well
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
