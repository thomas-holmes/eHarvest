class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :weight
      t.integer :quantity
      t.decimal :fee, precision: 8, scale: 2

      t.timestamps
    end
  end
end
