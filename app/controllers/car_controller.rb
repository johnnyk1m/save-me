class CarController < ApplicationController
  
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end
  
  def new
    @car = Car.new
  end

  def create
   @car = Car.new(car_params)
    if @car.valid?
     @car.save
     redirect_to cars_path
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to car_path
  end

  def destroy
  Car.destroy(params[:id])
  redirect_to cars_path
  end

  def car_params
  params.require(:car).permit(:make)
  end

end
