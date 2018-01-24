class MessageController < ApplicationController

	def create
		# puts "Message Params: #{params[:message_text].inspect}"

		if session[:current_user_id] != nil
			user_message = params[:message_text]
			if user_message != nil && user_message != ''
				message = Message.new
				message.message_text = user_message
				message.user_id = session[:current_user_id]
				
				if message.save
					redirect_to home_index_path
				end
			else
				redirect_to home_index_path
			end
		else
			redirect_to login_index_path
		end

	end

	private

	def message_params
    	params.require(:message_text)
	end
end
