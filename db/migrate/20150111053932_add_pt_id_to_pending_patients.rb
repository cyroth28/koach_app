class AddPtIdToPendingPatients < ActiveRecord::Migration
  def change
    add_reference :pending_patients, :pt, index: true
  end
end
