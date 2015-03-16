class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def login_user(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_redirect
    redirect_to users_url if logged_in?
  end

  def logged_out_redirect
    redirect_to new_session_url unless logged_in?
  end
end
