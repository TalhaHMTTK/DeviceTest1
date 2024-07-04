class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :super_admin, :company_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :super_admin, :company_id])
    devise_parameter_sanitizer.permit :accept_invitation, keys: [:role, :company_id, :email]
  end
end
