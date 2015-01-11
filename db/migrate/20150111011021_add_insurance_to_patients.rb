class AddInsuranceToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :insurance_company, :string
  end
end
