class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:new, :index, :destroy]
  before_action :set_location, only: [:edit, :update, :show, :destroy]

  def new
    authorize @customer, :location_new?
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    authorize @location
    if @location.save
      redirect_to location_path(@location)
    end
  end

  def index
    authorize @customer, :location_index?
    @locations = @customer.locations
  end

  def edit
    authorize @location
  end

  def update
    authorize @location
    if @location.update(location_params)
      redirect_to location_path(@location)
    end
  end

  def show
    authorize @location
  end

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
