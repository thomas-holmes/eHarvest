class AddAgencyRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :agency, index: true
  end
end
