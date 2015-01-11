pt1 = Pt.first_or_create(
  name: "Yifan",
  email: "yifan@gmail.com",
  clinic_id: 1,
  phone_number: "123-456-7890",
  password: "password"
  )

pt2 = Pt.first_or_create(
  name: "Connor",
  email: "connor@gmail.com",
  clinic_id: 1,
  phone_number: "123-456-7890",
  password: "password"
  )

pt1.patient_relationships.first_or_create(patient_id: 1)

Patient.first_or_create(
  name: "sick person",
  email: "sick@gmail.com",
  phone_number: "123-456-7280",
  password: "password"
)
