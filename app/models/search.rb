class Search < ActiveRecord::Base

  def items
    @items ||= find_items
  end
 
private
  def find_items
    items = Item.order(:name)
    items = items.where("name like ?", "%#{names.downcase}%") if names.present?
    items = items.where(category_id: category_id) if category_id.present?
    items
  end
end
