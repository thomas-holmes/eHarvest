class Order < ActiveRecord::Base
  belongs_to :agency
  belongs_to :location
  has_many :order_items
end
