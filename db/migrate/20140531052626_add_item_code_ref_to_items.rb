class AddItemCodeRefToItems < ActiveRecord::Migration
  def change
    add_reference :items, :item_code, index: true
  end
end
