class Location < ActiveRecord::Base
  has_many :orders
  has_and_belongs_to_many :agencies, unique: true
end
