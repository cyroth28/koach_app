class PtsController < ApplicationController
  include PtSessionModule
  before_action :require_pt_log_in, only: [:show, :index]
  def new
    @pt = Pt.new
    render :new
  end

  def create
    @pt = Pt.new(pt_params)

    if @pt.save
      log_in(@pt)
      redirect_to pt_url(@pt)
    else
      flash.now[:errors] = @pt.errors.full_messages
      render :new
    end
  end

  def index

  end

  def show
    @pt = Pt.find(params[:id])
  end

  private
  def pt_params
    params.require(:pt).permit(:clinic_id, :name, :phone_number, :email, :password)
  end
end
