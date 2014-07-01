class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.page(params[:page])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:notice] = "Successfully added new manufacturer"
      redirect_to manufacturers_path
    else
      flash[:alert] = "Invalid submission. Please include all
      required information about the manufacturer"
      render :new
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
