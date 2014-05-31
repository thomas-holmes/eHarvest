class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :item
      t.references :order, index: true
      t.integer :quantity
      t.decimal :fee, precision: 8, scale: 2
      t.float :weight

      t.timestamps
    end
  end
end
