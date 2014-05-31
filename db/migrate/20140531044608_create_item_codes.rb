class CreateItemCodes < ActiveRecord::Migration
  def change
    create_table :item_codes do |t|
      t.string :code

      t.timestamps
    end
  end
end
