class DestinController < ApplicationController
  def index
    @destins = Destin.all
  end

  def show
    @destin = Destin.find(destin_params)
  end
  
  def new
    @destin = Destin.new
  end

  def create
    @destin = Destin.new(destin_params)
    @user = current_user
    if @destin.valid?
     @destin.save
     redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @destin = Destin.find(params[:id])
  end

  def update
    @destin = Destin.find(params[:id])
    @destin.update(destin_params)
    redirect_to destin_path
  end

  def destroy
    Destin.destroy(params[:id])
    redirect_to destins_path
  end

  private

  def destin_params
    params.require(:destin).permit(:title, :start_date, :end_date, :alarm_date, :address, :latitude, :longitude)
  end
end
