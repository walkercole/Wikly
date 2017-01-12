class EventsController < ApplicationController

	def create
		@event = current_user.events.new(event_params)

		if @event.save
			redirect_to :back, notice: "Date Saved!"
			puts "saved"
		else
			@alert =  "Date could not be saved! #{@event.errors.full_messages}"
			render "home/index"
		end		
	end
	def index
		@events = current_user.events
	end

	def update

		@event = Event.find params[:id]

		if @event.update(event_params)
			redirect_to :back, notice: "Date Saved!"

		else
			@alert =  "Date could not be saved! #{@event.errors.full_messages}"
			redirect_to :back
		end		
	end

	def destroy
		@event = Event.find params[:id]
		@event.delete
		redirect_to :back, notice: "Event deleted"
	end

	private
		def event_params
			params.require(:event).permit! #(:title,:body,:start,:end,:day,:urgency,:location,:user_id)
		end
end