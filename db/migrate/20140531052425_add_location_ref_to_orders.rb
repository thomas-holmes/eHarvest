class AddLocationRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :location, index: true
  end
end
