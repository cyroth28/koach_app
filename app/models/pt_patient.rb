class PtPatient < ActiveRecord::Base
  validates :patient_id, :pt_id, presence: true

  belongs_to(:patient)
  belongs_to(:pt)
end
