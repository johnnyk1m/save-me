require 'twilio-ruby'

account_sid = ENV["TWILIO_ACCOUNT_SID"] 
auth_token = ENV["TWILIO_AUTH_TOKEN"]

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Greetings! The current time is: 153700 ZUOBWHSYY1EGLZL",
    to: "+16462449401",    # your phone number
    from: "+16467607420")  # your Twilio number

puts message.sid