class ApplicationController < ActionController::Base
  helper_method :current_user_admin?
  helper_method :authenticate_admin

  protect_from_forgery with: :exception

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def after_sign_in_path_for(resource)
    root_path
  end 

  def current_user_admin?
    current_user.try(:admin?)
  end

  def authenticate_admin
    redirect_to root_path unless current_user_admin?
  end
end
