
class RegisterController < ApplicationController

	def create
		puts("\nIn Register Create>> " + user_params.inspect)
    
    if user_params[:username] != '' && user_params[:password] != '' && user_params[:full_name]!=''
      @user = User.new(user_params)

      if @user.save
        session[:current_user_id] = @user.id
        redirect_to home_index_path
      else
        # This line overrides the default rendering behavior, which
        # would have been to render the "create" view.
        # render "new"
      end
    else
      redirect_to register_index_path
    end
	end

	private

	def user_params
    params.require(:user).permit(:username, :password, :full_name)
	end
	
end
