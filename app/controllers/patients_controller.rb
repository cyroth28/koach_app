class PatientsController < ApplicationController
  include PatientSessionModule
  before_action :require_patient_log_in, only: :show
  def new
    @pending_patient = find_pending_patient
    @patient = Patient.new(get_pending_patient_params(@pending_patient))
    render :new
  end

  def create
    @patient = Patient.new(patient_params)
    @pending_patient = find_pending_patient
    if save_patient
      log_in(@patient)
      redirect_to patient_url(@patient)
    else
      flash.now[:errors] = @patient.errors.full_messages
      render :new
    end
  end

  def show
    @patient = Patient.find(params[:id])
    render :show
  end

  private
  def find_pending_patient
    PendingPatient.find_by(verification_token: params[:verification_token])
  end

  def save_patient
    PendingPatient.transaction do
      Patient.transaction do
        @patient.save
        @pending_patient.destroy
      end
    end
  end

  def get_pending_patient_params pending_patient
    pending_patient_params = {}
    pending_patient_params[:name] = pending_patient.name
    pending_patient_params[:email] = pending_patient.email
    pending_patient_params[:insurance_company] = pending_patient.insurance_company
    pending_patient_params
  end

  def patient_params
    params.require(:patient).permit(:name, :phone_number, :email, :password)
  end
end
