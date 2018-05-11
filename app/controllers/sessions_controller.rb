class SessionsController < ApplicationController
  def new

  end
  def create
  	@user = User.find_by(email: params[:email])
  	if @user
  		if @user.authenticate(params[:password])
  			session[:user_id] = @user.id
  			session[:user] = @user.first_name
  			redirect_to "/users/#{session[:user_id]}"
  		else
  			flash[:error] = "Invalid Combination"
  			redirect_to sign_in_path
  		end
  		else 
  			flash[:error] = "Invalid Combination"
			redirect_to sign_in_path 
  		end
  	end
  def destroy
  	reset_session
  	redirect_to sign_in_path
  end
end
