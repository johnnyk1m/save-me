class AgendaController < ApplicationController
  
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
      if @agenda.valid?
       @agenda.save
       redirect_to agendas_path
      end
    end
  
    def edit
      @agenda = Agenda.find(params[:id])
    end
  
    def update
      @agenda = Agenda.find(params[:id])
      @agenda.update(agenda_params)
      redirect_to agenda_path
    end
  
    def destroy
    Agenda.destroy(params[:id])
    redirect_to agendas_path
    end
  
    def agenda_params
    params.require(:agenda).permit(:title)
    end
    
end
