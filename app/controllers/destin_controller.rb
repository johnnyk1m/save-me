class DestinController < ApplicationController
  def index
    @destins = Destin.all
  end

  def show
    @destin = Destin.find(params[:user_id])
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
    redirect_to root_path
  end

  def destroy
    @destin = Destin.destroy(params[:user_id])
    redirect_to root_path
  end

  def reminder
    @twilio_number = "+16467607420"
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    @client = Twilio::REST::Client.new account_sid, ENV['TWILIO_AUTH_TOKEN']
    time_str = ((self.alarm_date).localtime).strftime("%I:%M%p on %b. %d, %Y")
    body = "Hi #{self.contact_full_name}. Just a reminder that you have an alarm_date coming up at #{alarm_date_str}."
    message = @client.messages.create(
      :from => @twilio_number,
      :to => self.phone_number,
      :body => body,
    )
  end

  def when_to_run
    minutes_before_alarm_date = 2.minutes
    time - minutes_before_alarm_date
  end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }


  private

  def destin_params
    params.require(:destin).permit(:title, :start_date, :end_date, :alarm_date, :address, :latitude, :longitude, :voice_msg, :user_id)
  end
end
