class Item < ActiveRecord::Base
  belongs_to :item_code
  has_many :order_items
end
