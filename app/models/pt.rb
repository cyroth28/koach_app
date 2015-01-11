class Pt < ActiveRecord::Base
  include HasPassword

  validates :clinic_id, :name, :phone_number, presence: true
  validates :email, presence:true, uniqueness: true

  belongs_to(:clinic)
  has_many(:sessions, as: :sessionable, dependent: :destroy)
  has_many(
  :patient_relationships,
  class_name: "PtPatient",
  foreign_key: :pt_id,
  dependent: :destroy
  )
  has_many(:patients, through: :patient_relationships, source: :patient)
  has_many(:pending_patients, dependent: :destroy)

end
