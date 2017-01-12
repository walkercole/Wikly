class UsersController < ApplicationController

	def index
	end

	def avatar
	if params[:user]
		current_user.avatar = params[:user][:avatar]
		current_user.save!
		redirect_to edit_user_registration_path
	else
		redirect_to edit_user_registration_path,
		notice: "No Avatar Found"
	end
	end

	def edit
	end
end