class AgencyCode < ActiveRecord::Base
  has_and_belongs_to_many :agencies, unique: true
  has_and_belongs_to_many :item_codes, unique: true
end
