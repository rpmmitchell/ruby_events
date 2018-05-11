class CommentsController < ApplicationController
	def create
		@comment = Comment.create(content: params[:content], user_id: session[:user_id], event_id: params[:id])
		if @comment.valid?
			redirect_to "/events/#{params[:id]}"
		else
			flash[:errors] = @comment.errors.full_messages
			redirect_to "/events/#{params[:id]}"
		end
	end
	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to "/events/#{params[:id]}"
	end
end
