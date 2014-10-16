class PantriesController < ApplicationController

	def index
		# show all of the pantries for user
		# @user = User.find(params[current_user.id])
		@user
		# @pantries = @user.pantries
		render 'index'
	end

	def new
		@user
		@pantry = Pantry.new
	end

	def create
		@user
		@pantry = Pantry.new(pantry_params)
		if @pantry.save
			@pantry_participation = PantryParticipation.create(user_id: @user.id, pantry_id: @pantry.id)
				redirect_to user_pantries_path
		else
			redirect_to new_user_pantry_path
		end
	end

	def show
		@pantry = Pantry.find(params[:id])
	end

	def edit
		@pantry = Pantry.find(params[:id])
	end

	def update
		@pantry = Pantry.find(params[:id])
		@pantry.update(pantry_params)
		redirect_to user_pantries_path
	end

	def destroy
		@pantry = Pantry.find(params[:id])
		@pantry.destroy
		redirect_to user_pantries_path
	end

	private

	def pantry_params
		params.require(:pantry).permit(:name, :creator_id)
	end

end
