class CreatePendingPatients < ActiveRecord::Migration
  def change
    create_table :pending_patients do |t|
      t.string :name,            null: false
      t.string :email,           null: false
      t.string :insurance_company
      t.string :diagnosis
      t.timestamps
    end
    add_index :pending_patients, :email, unique: true
  end
end
