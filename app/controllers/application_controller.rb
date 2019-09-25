class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit({ roles: [] }, :image, :phone, :address1, :address2, :password, :password_confirmation, :current_password, user_skills_attributes: [:skill_id]) }
  end

end
