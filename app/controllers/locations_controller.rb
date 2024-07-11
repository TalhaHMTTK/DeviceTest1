class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:new, :index, :show, :destroy]
  before_action :set_location, only: [:edit, :update, :show, :destroy]

  def new
    if @customer.user_id == current_user.id
      @company = Company.find(params[:company_id])
      @location = Location.new
    else
      flash[:alert] = "You are not authorized to add the location of other user's customers"
      redirect_to locations_path(customer_id: @customer.id)
    end
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      @customer = Customer.find(@location.customer_id)
      redirect_to location_path(id: @location.id, customer_id: @customer.id)
    end
  end

  def index
    @locations = Location.where(customer_id: @customer.id)
  end

  def edit; end

  def update
    if @location.update(location_params)
      @customer = Customer.find(@location.customer_id)
      redirect_to location_path(id: @location.id, customer_id: @customer.id)
    end
  end

  def show; end

  def destroy
    @location.destroy
    redirect_to locations_path(customer_id: @customer.id)
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :customer_id, :company_id)
  end
end
