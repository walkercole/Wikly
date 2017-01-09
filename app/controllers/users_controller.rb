class UsersController < ApplicationController

	def index
	end

	def avatar
	current_user.avatar = params[:user][:avatar]
	current_user.save!
	redirect_to edit_user_registration_path
	end

	def edit
	end
end