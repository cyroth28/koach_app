module PatientSessionModule
  extend ActiveSupport::Concern

  included do

  end

  def require_patient_log_in
    unless current_user.class == Patient
      flash[:errors] = ["Please log in first."]
      redirect_to new_patient_session_url
    end
  end


end
