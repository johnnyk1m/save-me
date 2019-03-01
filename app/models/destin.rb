class Destin < ApplicationRecord
  # validates :start_date,  presence: true
  # validates :end_date,   presence: true
  # validates :alarm_date,  presence: true

  has_many :contacts
  belongs_to :user

  after_create :reminder

  def reminder
    @twilio_number = "+16467607420"
    
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    @client = Twilio::REST::Client.new account_sid, ENV['TWILIO_AUTH_TOKEN']
    alarm_date_str = ((self.alarm_date).localtime).strftime("%I:%M%p on %b. %d, %Y")
    body = "HELP ME! I've fallen and I can't get up! Alarm started at #{alarm_date_str}."
    message = @client.messages.create(
      :from => @twilio_number,
      :to => "+16462449401",
      :body => "HELP ME! I've fallen and I can't get up! Alarm started at #{alarm_date_str}.",
    )
  end
end
