class LoginController < ApplicationController

  def index
    
  end

  def create
    username = params[:user][:username]
    password = params[:user][:password]
    puts "\n\nParams: #{username}, #{password}\n\n"
    @curr_user = User.where(username: username, password: password).first
    if @curr_user != nil
      puts "\nLogin Success :)"
      session[:current_user_id] = @curr_user.id
      # session[:login_msg] = 'You have been logged in successfully';
      session[:login_msg] = ''
      redirect_to home_index_path
    else
      puts "\nLogin Failed!"
      session[:login_failed] = true
      session[:login_msg] = 'Your login attempt has been failed. Please try again!';
      redirect_to login_index_path
    end
  end


  def logout
    session[:current_user_id] = nil
    session[:login_failed] = false
    session[:login_msg] = 'You have been logged out!';
    redirect_to login_index_path
  end

end
