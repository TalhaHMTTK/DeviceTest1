class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new, :index, :show, :destroy]
  before_action :set_customer, only: [:edit, :update, :show, :destroy]

  def new
    if @user.id == current_user.id
      @company = Company.find(params[:company_id])
      @customer = Customer.new
    else
      flash[:alert] = "You are not authorized to create the customer of other users"
      redirect_to customers_path(user_id: @user.id)
    end
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      @user = User.find(@customer.user_id)
      redirect_to customer_path(id: @customer.id, user_id: @user.id)
    end
  end

  def index
    @customers = Customer.where(user_id: @user.id)
  end

  def edit; end

  def update
    if @customer.update(customer_params)
      @user = User.find(@customer.user_id)
      redirect_to customer_path(id: @customer.id, user_id: @user.id)
    end
  end

  def show; end


  def destroy
    @customer.destroy
    redirect_to customers_path(user_id: @user.id)
  end

  def all_customers
    if current_user.role == "admin"
      @customers = Customer.all
    else 
      redirect_to root_path
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def customer_params
    params.require(:customer).permit(:name, :phone, :address, :user_id, :company_id)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
