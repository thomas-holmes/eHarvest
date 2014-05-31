class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :agency_id, :integer
  end
end
