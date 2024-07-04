class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters
  before_action :set_company, only: [:new, :create]

  def new
    super
  end

  def create
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:role, :company_id])
  end

  def set_company
    user = current_user
    @company_id = user.company_id
  end
end
