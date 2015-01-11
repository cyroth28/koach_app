class Patient < ActiveRecord::Base
  include HasPassword
  
  has_many(:clinics, through: :pts, source: :clinic)
  has_many(:sessions, as: :sessionable, dependent: :destroy)

  has_many(
  :pt_relationships,
  class_name: "PtPatient",
  foreign_key: :patient_id,
  dependent: :destroy
  )
  has_many(:pts, through: :pt_relationships, source: :pt)

end
