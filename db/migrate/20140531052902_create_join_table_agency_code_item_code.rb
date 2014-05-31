class CreateJoinTableAgencyCodeItemCode < ActiveRecord::Migration
  def change
    create_join_table :agency_codes, :item_codes do |t|
      t.index [:agency_code_id, :item_code_id], name: 'agency_code_to_item_code_index', unique: true
      t.index [:item_code_id, :agency_code_id], name: 'item_code_to_agency_code_index', unique: true
    end
  end
end
