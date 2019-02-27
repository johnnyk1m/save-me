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
    if @destin.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @destin = Destin.find(params[:user_id])
  end

  def update
    @destin = Destin.find(params[:user_id])
    @destin.update(destin_params)
    redirect_to destin_path
  end

  def destroy
    @destin = Destin.destroy(params[:user_id])
    redirect_to root_path
  end

  private

  def destin_params
    params.require(:destin).permit(:title, :start_date, :end_date, :alarm_date, :address, :latitude, :longitude, :voice_msg, :user_id)
  end
end
