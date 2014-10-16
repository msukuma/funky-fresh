class PantriesController < ApplicationController

	def index
		# show all of the pantries for user
	end

	def new
		@pantry = Pantry.new
	end

	def create
		@pantry = Pantry.new(pantry_params)
		if @pantry.save
			@pantry_participation = PantryParticipation.create(user_id: current_user.id, pantry_id: @pantry.id)
				redirect_to user_pantry_index_path
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
		redirect_to user_pantry_index_path
	end

	def destroy
		@pantry = Pantry.find(params[:id])
		@pantry.destroy
		redirect_to user_pantry_index_path
	end

	private

	def pantry_params
		params.require(:pantry).permit(:name, :creator_id)
	end

end
