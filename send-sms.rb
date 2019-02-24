require 'twilio-ruby'

account_sid = "ACdd175fbd2e067fca43678beb7b3f4f64" 
auth_token = "24e7ea8b8625f1e21ea293c00ae6413c"

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Greetings! The current time is: 153700 ZUOBWHSYY1EGLZL",
    to: "+16462449401",    # your phone number
    from: "+16467607420")  # your Twilio number

puts message.sid