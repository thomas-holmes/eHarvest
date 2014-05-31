class Order < ActiveRecord::Base
  belongs_to :agency
  has_many :order_items
end
