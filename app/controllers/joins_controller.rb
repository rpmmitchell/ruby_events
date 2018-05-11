class JoinsController < ApplicationController
	def create
		@join = Join.create(user_id: session[:user_id], event_id: params[:id])
		redirect_to "/users/#{session[:user_id]}"
	end
	def destroy
		@join = Join.find_by(user_id: session[:user_id], event_id: params[:id])
		@join.destroy
		redirect_to "/users/#{session[:user_id]}"
	end
end
