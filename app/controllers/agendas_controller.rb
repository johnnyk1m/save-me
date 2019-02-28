class AgendasController < ApplicationController
  
    def index
      @agendas = Agenda.all
    end
  
    def show
      @agenda = Agenda.find(params[:id])
    end
    
    def new
      @agenda = Agenda.new
    end
  
    def create
      @agenda = Agenda.new(agenda_params)
      @user = current_user
      if @agenda.save
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
  
    def edit
      @agenda = Agenda.find(params[:user_id])
    end
  
    def update
      @agenda = Agenda.find(params[:user_id])
      @agenda.update(agenda_params)
      redirect_to root_path
    end
  
    def destroy
    Agenda.destroy(params[:user_id])
    redirect_to root_path
    end
  
    def agenda_params
    params.require(:agenda).permit(:title)
    end
    
end
