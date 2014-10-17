class PantriesController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		render 'index'
	end

	def new
		@user = User.find(params[:user_id])
		@pantry = Pantry.new
	end

	def create
		@user = User.find(params[:user_id])
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
		@user = User.find(params[:user_id])
		@pantry = Pantry.find(params[:id])
	end

	def update
		# raise params
		@pantry = Pantry.find(params[:id])
		@pantry.update(pantry_params)
		redirect_to user_pantries_path
	end

	def destroy
		@user = User.find(params[:user_id])
		@pantry = Pantry.find(params[:id])
		@pantry.destroy
		redirect_to user_pantries_path
	end

	private

	def pantry_params
		params.require(:pantry).permit(:name, :creator_id)
	end

end
