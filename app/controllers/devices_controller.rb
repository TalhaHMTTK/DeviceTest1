class DevicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location, only: [:new, :index, :show, :destroy]
  before_action :set_device, only: [:edit, :update, :show, :destroy]

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      @location = Location.find(@device.location_id)
      redirect_to device_path(id: @device.id, location_id: @location.id)
    end
  end

  def index
    @devices = Device.where(location_id: @location.id)
  end

  def edit; end

  def update
    if @device.update(device_params)
      @location = Location.find(@device.location_id)
      redirect_to device_path(id: @device.id, location_id: @location.id)
    end
  end

  def show; end

  def destroy
    @device.destroy
    redirect_to devices_path(location_id: @location.id)
  end

  private

  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:name, :company_name, :model, :location_id)
  end
end
