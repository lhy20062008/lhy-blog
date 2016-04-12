class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    return nil unless session[:user_id].present?
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def ensure_sigin_in!
    return if current_user.present?
  end
end
