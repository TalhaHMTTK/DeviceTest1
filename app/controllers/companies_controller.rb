class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def new
    @company = Company.new
  end

  def create
    @company= Company.new(company_params)
    @company.save
    redirect_to @company
  end

  def index
    if current_user.super_admin?
      @companies = Company.all
    else
      @companies = Company.where(id: current_user.company_id)
    end
  end

  def show
    @company = Company.find(params[:id])
    @users = User.where(company_id: @company.id)
  end
  private

  def company_params
    params.require(:company).permit(:name)
  end
end
