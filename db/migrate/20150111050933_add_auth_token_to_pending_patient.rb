class AddAuthTokenToPendingPatient < ActiveRecord::Migration
  def change
    add_column :pending_patients, :verification_token, :string
  end
end
