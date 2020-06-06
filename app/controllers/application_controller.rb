class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    users_path
  end
  
  private
  # sign_upの時にnameとprofileを許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:profile])
    devise_parameter_sanitizer.permit(:sign_up, keys:[:profile_image])
  end
  
 
end
