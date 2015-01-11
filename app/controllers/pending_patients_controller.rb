class PendingPatientsController < ApplicationController
  def new
    @pending_patient = PendingPatient.new
    render :edit
  end

  def create
    @pending_patient = PendingPatient.new(pending_patient_params)
    if @pending_patient.save
      PatientVerificationMailer.verification_email(@pending_patient).deliver
      redirect_to pt_url(current_user)
    else
      flash.now[:errors] = @pending_patient.errors.full_messages
      render :new
    end
  end

  def edit
    @pending_patient = PendingPatient.find(params[:id])
    render :edit
  end

  def update
    @pending_patient = PendingPatient.find(params[:id])
    if @pending_patient.update(pending_patient_params)
      redirect_to pt_url(current_user)
    else
      flash.now[:errors] = @pending_patient.errors.full_messages
      render :edit
    end
  end

  def destroy
    @pending_patient = PendingPatient.find(params[:id])
    @pending_patient.destroy
    redirect_to pt_url(current_user)
  end

  private
  def pending_patient_params
    params.require(:pending_patient).permit(:name, :email, :insurance_company, :diagnosis)
          .merge(pt_id: current_user.id)
  end
end
