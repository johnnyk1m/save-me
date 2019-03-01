class HomeController < ApplicationController

  def index
    @car = Car.all
    @destin = Destin.all
    @agenda = Agenda.all
    @contacts = Contact.all
    @user = User.all
  end

  def sendSMSAlarm
    @user = User.all
    @destin = Destin.all
    @contact = Contact.all
  end

end
