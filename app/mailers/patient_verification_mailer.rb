require 'addressable/uri'

class PatientVerificationMailer < ActionMailer::Base
  default from: "Welcome@Koach.io"

  def verification_email pending_patient
    @pending_patient = pending_patient
    @pt = pending_patient.pt
    @url = new_patient_url + "?verification_token=#{pending_patient.verification_token}"
    mail to: pending_patient.email, subject: "Welcome to Koach!"
  end
end
