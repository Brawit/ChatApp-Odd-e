class ApplicationController < ActionController::Base
  helper_method :current_user
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to login_path, alert: "Please log in first" if current_user.nil?
  end

  private
end
