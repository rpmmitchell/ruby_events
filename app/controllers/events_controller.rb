class EventsController < ApplicationController

	def index 
		@event = Event.find(params[:id])
		@comments = Comment.all
	end


	def create
		@event = Event.create(name: params[:name], date: params[:date], location: params[:location], user_id: params[:user_id], host: params[:user])
		if @event.valid?
			redirect_to "/users/#{session[:user_id]}"
		else
			flash[:errors] = @event.errors.full_messages
			redirect_to "/users/#{session[:user_id]}"
		end
	end
	def edit
		@event = Event.find(params[:id])
	end
	def update
		@event = Event.find(params[:id])
		@event.update(name: params[:name], date: params[:date], location: params[:location])
		if @event.valid?
			redirect_to "/users/#{session[:user_id]}"
		else
			flash[:errors] = @event.errors.full_messages
			redirect_to "/events/#{params[:id]}/edit"
		end
	end
	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to "/users/#{session[:user_id]}"
	end
end
