class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :names
      t.integer :category_id

      t.timestamps
    end
  end
end
