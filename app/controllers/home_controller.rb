class HomeController < ApplicationController

  def index
    @car = Car.all
    @destin = Destin.all
    @agenda = Agenda.all
    @contact = Contact.all
    @user = User.all
  end

end
