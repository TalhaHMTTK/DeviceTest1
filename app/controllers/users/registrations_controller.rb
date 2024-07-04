class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def new
    build_resource({})
    resource.build_company
    respond_with self.resource
  end

  def create
    super do |resource|
      # Find or create the company by name
      resource.company = Company.find_or_create_by(name: params[:user][:company_attributes][:name])
      # Save the resource (user) with the associated company
      resource.save
    end
  end

  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :super_admin, company_attributes: [:name]])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :super_admin, company_attributes: [:name]])
  end
end
