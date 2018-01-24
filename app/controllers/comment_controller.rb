class CommentController < ApplicationController
	
	def create 
		# puts "\n\n>> Adding comment: #{params[:cmt_text]}, #{params[:message_id]} \n\n"

		if session[:current_user_id] != nil
			if params[:cmt_text] != ''
				cmt = Comment.new
				cmt.cmt_text = params[:cmt_text]
				cmt.message_id = params[:message_id]
				cmt.user_id = session[:current_user_id]
				
				if cmt.save
					redirect_to home_index_path
				end
			else
				redirect_to home_index_path
			end
			
		else
			redirect_to login_index_path
		end

	end

end
