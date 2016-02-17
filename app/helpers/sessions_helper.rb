module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out(user)
    user.remember_token = nil
    cookies.delete(:remember_token)
    session.delete(:user_id)
    @current_user = nil
  end

  def remember(user)
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
