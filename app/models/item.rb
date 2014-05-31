class Item < ActiveRecord::Base
  belongs_to :item_code
  has_many :order_items


  before_save :to_lower

  def to_lower
    self.name = self.name.downcase
  end
  # This should be done by the database as well
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  # scope :for_agency, ->(agency_id) { where("items.id in
  #   (select id from item_codes inner join agency_codes_item_codes
  #     on (item_codes.id = agency_codes_item_codes.item_code_id)
  #     where agency_codes_item_codes.agency_code_id
  #     in ( select agency_code_id from agencies_agency_codes where agency_id = ? ))", agency_id) }

  # QUERY!
  # I wonder if there's a better way to do this. Probably is... :(
  # select * from items where items.id in
  # (select id from item_codes inner join agency_codes_item_codes
  #   on (item_codes.id = agency_codes_item_codes.item_code_id)
  #   where agency_codes_item_codes.agency_code_id
  #   in ( select agency_code_id from agencies_agency_codes where agency_id = 1 ));

end
