class UserController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		
	end

	def edit	

	end

	def update	
		@user = User.find(params[:id])	
		@user.update_attributes(user_params)
		redirect_to user_path
	end

	def destroy
		
	end

	def user
	private

	def user_params
		params.require(:user).permit(:first_name, :last_name)
	end

end
