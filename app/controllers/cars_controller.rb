class CarsController < ApplicationController
  def index
    @cars = Car.page(params[:page])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "Successfully added new car"
      redirect_to cars_path
    else
      flash[:notice] = "Invalid submission. Please include all 
      required information about the car"
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:manufacturer_id, :color, :year, :mileage, :description)
  end
end
