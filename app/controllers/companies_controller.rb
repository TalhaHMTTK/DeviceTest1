class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update]

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
    @users = User.where(company_id: @company.id)
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to @company
    end
  end
  private

  def company_params
    params.require(:company).permit(:name, :phone)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
