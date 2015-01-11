class PtSessionsController < ApplicationController
  include PtSessionModule
  
  before_action :require_pt_log_in, only: :destroy
  def new
    @pt = Pt.new
  end

  def create
    @pt = Pt.find_by_credentials(
      params[:pt][:email],
      params[:pt][:password]
    )
    if @pt
      log_in @pt
      redirect_to pt_url(@pt)
    else
      @pt = Pt.new
      flash.now[:errors] = "Incorrect Email, Password"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to new_pt_session_url # change later
  end

  private
  def user_params
    params.require(:pt).permit(:email, :password)
  end
end
