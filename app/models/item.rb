class Item < ActiveRecord::Base
  belongs_to :item_code
  has_many :order_items

  before_save :to_lower

  def to_lower
    self.name = self.name.downcase
  end
end
