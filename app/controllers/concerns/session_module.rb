require 'active_support/inflector'

module SessionModule
  extend ActiveSupport::Concern
  included do
    helper_method :current_user
  end

  def current_user
    current_session = Session.find_by(token: session[:session_token])
    return nil unless current_session
    current_session.sessionable_type.constantize.find(current_session.sessionable_id)
  end

  def log_in person
    current_session = person.sessions.create
    session[:session_token] = current_session.token
  end

  def log_out
    current_session = Session.find_by(token: session[:session_token])
    current_session.destroy
    session[:session_token] = nil
  end
end
