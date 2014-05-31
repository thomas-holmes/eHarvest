class AgencyCode < ActiveRecord::Base
  has_and_belongs_to_many :agencies, -> { uniq }
  has_and_belongs_to_many :item_codes, -> { uniq }
end
