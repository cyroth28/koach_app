class CreatePtPatients < ActiveRecord::Migration
  def change
    create_table :pt_patients do |t|
      t.integer :pt_id, null: false
      t.integer :patient_id, null: false

      t.timestamps
    end
    add_index :pt_patients, :pt_id
    add_index :pt_patients, :patient_id
  end
end
