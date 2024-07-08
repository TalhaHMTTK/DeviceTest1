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
      resource.company = Company.find_or_create_by(company_params)
      # Save the resource (user) with the associated company
      resource.save
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to company_path(current_user.company_id)
    else
      redirect_to company_path(current_user.company_id)
    end
  end

  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :super_admin, company_attributes: [:name, :phone]])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :super_admin, company_attributes: [:name, :phone]])
  end

  private 
  def company_params
    params.require(:user).require(:company_attributes).permit(:name, :phone)
  end
end
