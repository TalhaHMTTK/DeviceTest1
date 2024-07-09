class CustomersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.find(params[:user_id])
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params.require(:customer).permit(:name, :phone, :address, :user_id))
    @customer.save
    @user = User.find(@customer.user_id)
    redirect_to customer_path(id: @customer.id, user_id: @user.id)
  end

  def index
    @user = User.find(params[:user_id])
    @customers = Customer.where(user_id: @user.id)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(params.require(:customer).permit(:name, :phone, :address, :user_id))
    @user = User.find(@customer.user_id)
    redirect_to customer_path(id: @customer.id, user_id: @user.id)
  end

  def show
    @user = User.find(params[:user_id])
    @customer = Customer.find(params[:id])
  end
  def destroy
    @user = User.find(params[:user_id])
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path(user_id: @user.id)
  end

end
