class CreateJoinTableAgencyLocation < ActiveRecord::Migration
  def change
    create_join_table :agencies, :locations do |t|
      t.index [:agency_id, :location_id], unique: true
      t.index [:location_id, :agency_id], unique: true
    end
  end
end
