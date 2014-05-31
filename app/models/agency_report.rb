class AgencyReport < ActiveRecord::Base
  belongs_to :report
  belongs_to :agency
end
