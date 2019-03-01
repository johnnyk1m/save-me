class SendSMS
    def self.alarmed 

    end

    def run
    require 'twilio-ruby'

    account_sid = ENV["TWILIO_ACCOUNT_SID"] 
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Emergency! Help Me!!!",
        to: "+#{@contact.mobile}",    # your phone number
        from: "+16467607420")  # your Twilio number

    puts message.sid
    end
end