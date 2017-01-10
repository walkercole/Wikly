class HomeController < ApplicationController
	def index
		@user = current_user
		@event = Event.new
	end

end