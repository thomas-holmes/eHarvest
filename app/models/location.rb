class Location < ActiveRecord::Base
  has_and_belongs_to_many :agencies, unique: true
  has_many :orders
end
