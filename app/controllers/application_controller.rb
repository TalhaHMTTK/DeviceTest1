class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  set_current_tenant_through_filter
  before_action :set_tenant, if: -> { current_user }
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def after_sign_in_path_for(resource)
    current_user.role == "admin" ? company_path(current_user.company_id) : (user_path(current_user))
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :super_admin, :company_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :super_admin, :company_id])
    devise_parameter_sanitizer.permit :accept_invitation, keys: [:role, :company_id, :email]
  end

  private

  def set_tenant
    set_current_tenant(current_user.company)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to view this page."
    current_user.role == "admin" ? redirect_to(company_path(current_user.company_id)) : redirect_to(user_path(current_user))
  end
end
