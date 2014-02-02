module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token 
    self.current_user = user
    session[:user_id] = user.id
  end
  
  def current_user=(user) 
    @current_user = user
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    end
  end
  
  def signed_in? 
    !current_user.nil?
  end
end