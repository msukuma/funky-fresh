class PantriesController < ApplicationController
	before_action :shorten, only: [:new, :create, :edit, :update, :destroy, :show]

	def new
		show_door unless session[:user_id] == params[:user_id]
		@pantry = Pantry.new
	end

	def create
		@pantry = Pantry.new(pantry_params)
		if @pantry.save
			@pantry_participation = PantryParticipation.create(user_id: @user.id, pantry_id: @pantry.id)
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def show
		show_door unless session[:user_id] == params[:user_id]
		@pantry = Pantry.find(params[:id])
	end

	def edit
		show_door unless session[:user_id] == params[:user_id]
		@pantry = Pantry.find(params[:id])
	end

	def update
		@pantry = Pantry.find(params[:id])
		if @pantry.update(pantry_params)
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	def destroy
		@pantry = Pantry.find(params[:id])
		@pantry.destroy
		redirect_to user_path(@user)
	end

		private

	def pantry_params
		params.require(:pantry).permit(:name, :creator_id)
	end

	def shorten
    @user = User.find(params[:user_id])
  end
end
