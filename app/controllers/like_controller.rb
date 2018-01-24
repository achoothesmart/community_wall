class LikeController < ApplicationController
	def create
		
		if session[:current_user_id] != nil
		
			message_id = params[:message_id]
			user_id = session[:current_user_id]
			like = Like.where(message_id: message_id, user_id: user_id).first
			if like != nil
				puts "\n\n like1 = #{like.inspect}\n\n"
				Like.where(message_id: message_id, user_id: user_id).destroy_all
				redirect_to home_index_path
			else
				like = Like.new
				like.message_id = message_id
				like.user_id = user_id
				if like.save
					redirect_to home_index_path
				end
				puts "\n\n like2 = #{like.inspect}\n\n"
			end
		
		else
			redirect_to login_index_path
		end
	
	end
end
