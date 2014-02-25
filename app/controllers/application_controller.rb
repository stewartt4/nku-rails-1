class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #force_ssl
  include SessionsHelper
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end
  helper_method :current_user
  
#private
# def current_user
#    @current_user ||= User.find(session[:user_id]) if session[:user_id]
#  end
#  helper_method :current_user

end
