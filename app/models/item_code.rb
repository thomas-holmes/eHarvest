class ItemCode < ActiveRecord::Base
  has_many :items
  has_and_belongs_to_many :agency_codes, -> { uniq }
end
