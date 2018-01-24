class HomeController < ApplicationController
	before_action :get_current_user, only: :index

	def index
		if @curr_user != nil
			@messages = Message.joins(:user)
		else 
			session[:login_failed] = true
			session[:login_msg] = 'Your login attempt has been failed. Please try again!';
			redirect_to login_index_path
		end
	end

	private

	def get_current_user
		# puts "\n\nsession[:current_user_id] = #{session[:current_user_id]}\n\n"
		@curr_user = User.where(id: session[:current_user_id]).first
		# puts "\n@curr_user = #{@curr_user.inspect}"
	end
end




