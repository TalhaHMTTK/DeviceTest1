class DevicesController < ApplicationController
  before_action :authenticate_user!

  def new
    @location = Location.find(params[:location_id])
    @device = Device.new
  end

  def create
    @device = Device.new(params.require(:device).permit(:name, :company_name, :model, :location_id))
    if @device.save
      @location = Location.find(@device.location_id)
      redirect_to device_path(id: @device.id, location_id: @location.id)
    end
  end

  def index
    @location = Location.find(params[:location_id])
    @devices = Device.where(location_id: @location.id)
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])
    @device.update(params.require(:device).permit(:name, :location_id))
    @location = Location.find(@device.location_id)
    redirect_to device_path(id: @device.id, location_id: @location.id)
  end

  def show
    @location = Location.find(params[:location_id])
    @device = Device.find(params[:id])
  end

  def destroy
    @location = Location.find(params[:location_id])
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to devices_path(location_id: @location.id)
  end

end
