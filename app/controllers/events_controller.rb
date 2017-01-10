class EventsController < ApplicationController

	def create
		@event = current_user.events.new(event_params)
		if @event.save
			redirect_to :back, notice: "Date Saved!"
			puts "saved"
		else
			flash[:alert] =  "Date could not be saved!"
			render "home/index"
		end		
	end
	def index
	end
	private
		def event_params
			params.require(:event).permit(:title,:body,:start,:end,:day,:urgency,:location,:user_id)
		end
end