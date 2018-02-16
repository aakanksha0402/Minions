class TwiliosController < ApplicationController
	layout 'twilio'
	def index
	end

  def verify_phone
  	phone_number = "+91" + params[:phone_no]
  	send_verification_code(phone_number)
  end

private

  def send_verification_code(phone_number)
    twilio_client = Twilio::REST::Client.new APP_CONFIG["twilio_account_sid"], APP_CONFIG["twilio_auth_token"]
    code = rand.to_s[2..9]
    disp_msg = "Your verification code is #{code}"
    twilio_client.api.account.messages.create(:from => '+17162446350', :to => phone_number, :body => disp_msg)
  end
end
