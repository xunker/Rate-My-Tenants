class MessagesController < ApplicationController
	before_filter :login_required

	def index
	end

	def show
		@message = Message.find_by_id_and_to_user_id(params[:id], current_user.id) or raise ActiveRecord::RecordNotFound
		@message.read! if @message.unread?
	end

	def new
	end

	def delete
	end
end
