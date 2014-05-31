class CreateAgencyCodes < ActiveRecord::Migration
  def change
    create_table :agency_codes do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
