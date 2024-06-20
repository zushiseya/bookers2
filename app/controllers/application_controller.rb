class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!, except: [:top, :about]
  def after_sign_in_path_for(resource)
    flash[:notice] = "Signed in successfully."
    user_path(current_user.id)
  end
  
  def after_sign_up_path_for(resource)
    flash[:notice] = "Welcome! You have signed up successfully"
    user_path(current_user.id)
  end
  
  def after_log_out_path_for(resource)
    flash[:notice] = "Signed out successfully."
    top_homes_path
  end
 
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end 
end