class Agency < ActiveRecord::Base
  has_many :users
  has_and_belongs_to_many :locations, unique: true
  has_and_belongs_to_many :agency_codes, unique: true
end
