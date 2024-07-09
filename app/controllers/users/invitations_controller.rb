class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters
  before_action :set_company, only: [:new, :create]
  before_action :check_admin, only: [:new]

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

  def check_admin
    unless current_user.role == "admin"
      flash[:alert] = "Tester can't invite other users"
      redirect_to user_path(current_user)
    end
  end
end
