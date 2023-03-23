class ApplicationController < ActionController::Base
  before_action :set_current_user
  protect_from_forgery
  
  private
  
  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    redirect_to login_path, alert: "You must be logged in to do that" if @current_user.nil?
  end
end
