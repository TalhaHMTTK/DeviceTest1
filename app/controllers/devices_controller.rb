class DevicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location, only: [:new, :index, :destroy]
  before_action :set_device, only: [:edit, :update, :show, :destroy]

  def new
    authorize @location, :device_new? 
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    authorize @device
    if @device.save
      redirect_to device_path(@device)
    end
  end

  def index
    authorize @location, :device_index?
    @devices = @location.devices
  end

  def edit
    authorize @device
  end

  def update
    authorize @device
    if @device.update(device_params)
      redirect_to device_path(@device)
    end
  end

  def show
    authorize @device
  end

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
    params.require(:device).permit(:name, :company_name, :model, :location_id, :company_id)
  end
end
