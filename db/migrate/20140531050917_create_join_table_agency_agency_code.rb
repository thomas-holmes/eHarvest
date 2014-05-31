class CreateJoinTableAgencyAgencyCode < ActiveRecord::Migration
  def change
    create_join_table :agencies, :agency_codes do |t|
      t.index [:agency_id, :agency_code_id], unique: true
      t.index [:agency_code_id, :agency_id], unique: true
    end
  end
end
