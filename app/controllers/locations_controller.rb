class LocationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @customer = Customer.find(params[:customer_id])
    @location = Location.new
  end

  def create
    @location = Location.new(params.require(:location).permit(:name, :customer_id))
    @location.save
    @customer = Customer.find(@location.customer_id)
    redirect_to location_path(id: @location.id, customer_id: @customer.id)
  end

  def index
    @customer = Customer.find(params[:customer_id])
    @locations = Location.where(customer_id: @customer.id)
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(params.require(:location).permit(:name, :customer_id))
    @customer = Customer.find(@location.customer_id)
    redirect_to location_path(id: @location.id, customer_id: @customer.id)
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @location = Location.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_path(customer_id: @customer.id)
  end

end
