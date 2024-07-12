class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new, :index, :show, :destroy]
  before_action :set_customer, only: [:edit, :update, :show, :destroy]

  def new
    authorize @user, :customer_new?
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    authorize @customer
    if @customer.save
      @user = User.find(@customer.user_id)
      redirect_to customer_path(id: @customer.id, user_id: @user.id)
    end
  end

  def index
    authorize @user, :customer_index?
    @customers = Customer.where(user_id: @user.id)
  end

  def edit
    authorize @customer
  end

  def update
    authorize @customer
    if @customer.update(customer_params)
      @user = User.find(@customer.user_id)
      redirect_to customer_path(id: @customer.id, user_id: @user.id)
    end
  end

  def show
    authorize @customer
  end


  def destroy
    @customer.destroy
    redirect_to customers_path(user_id: @user.id)
  end

  def all_customers
    authorize current_user, :show_all_customer?
    @customers = Customer.all
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
