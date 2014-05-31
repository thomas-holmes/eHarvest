class Agency < ActiveRecord::Base
  has_many :users
  has_many :orders
  has_and_belongs_to_many :locations, -> { uniq }
  has_and_belongs_to_many :agency_codes, -> { uniq }
end
