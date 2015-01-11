module PtSessionModule
  extend ActiveSupport::Concern


  def require_pt_log_in
    unless current_user.class == Pt
      flash[:errors] = ["Please log in first."]
      redirect_to new_pt_session_url
    end
  end

end
