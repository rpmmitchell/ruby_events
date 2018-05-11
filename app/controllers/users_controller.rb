class UsersController < ApplicationController
	def index
		@user = User.find(session[:user_id])
		@events = Event.all
		@joins = Join.all
	end
	def create
		if params[:password] == params[:password_confirmation]
			@user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], location: params[:location], password: params[:password])
			if @user.valid?
				session[:user] = @user.first_name
				session[:user_id] = @user.id
				redirect_to "/users/#{session[:user_id]}"
			else
				flash[:errors] = @user.errors.full_messages
				redirect_to sign_in_path
			end
		else
			flash[:error] = "Passwords do not match"
			redirect_to sign_in_path
		end
	end
	def edit
		@user = User.find(session[:user_id])
	end
	def update
		@user = User.find(session[:user_id])
		@user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], location: params[:location])
		if @user.valid?
			redirect_to "/users/#{session[:user_id]}"
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to "/users/#{session[:user_id]}/edit"
		end
	end
end
