class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
