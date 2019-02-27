class CarController < ApplicationController
  
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:user_id])
  end
  
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @user = current_user
    if @car.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @car = Car.find(params[:user_id])
  end

  def update
    @car = Car.find(params[:user_id])
    @car.update(car_params)
    redirect_to root_path
  end

  def destroy
  Car.destroy(params[:user_id])
  redirect_to root_path
  end

  def car_params
  params.require(:car).permit(:make)
  end

end
