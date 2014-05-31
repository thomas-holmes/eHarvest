class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :requester
      t.string :recipient
      t.datetime :delivery_date

      t.timestamps
    end
  end
end
