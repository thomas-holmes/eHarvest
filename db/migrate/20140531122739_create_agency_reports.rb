class CreateAgencyReports < ActiveRecord::Migration
  def change
    create_table :agency_reports do |t|
      t.references :report
      t.references :agency
      t.boolean :completed

      t.timestamps

    end
  end
end
