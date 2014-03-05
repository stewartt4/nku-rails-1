class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end
  helper_method :current_user
  
  before_action :require_login
  skip_before_action :require_login, only: [:signin, :new] 
  private
 
  def require_login
    unless current_user
      redirect_to signin_path # halts request cycle
    end
  end

end
