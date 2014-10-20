class PantriesController < ApplicationController
	before_action :find_user, only: [:new, :create, :edit, :update, :destroy, :show]
	before_action :show_door
	autocomplete :prototype, :name, full: true

	def new
		redirect_to user_path(current_user) unless current_user.id.to_s == params[:user_id]
		@pantry = Pantry.new
  end

	def create
		@pantry = Pantry.create(pantry_params)
		@user = current_user

		respond_to do |format|
			format.html {redirect_to user_path(@user)}
      format.json {render json: {:pantry => @pantry}}
      format.js { render "create", :locals => {:pantry => @pantry} }
		end
		# if @pantry.save
		# 	redirect_to user_path(@user)
		# else
		# 	render 'new'
		# end
	end

	def show
		redirect_to user_path(current_user) unless current_user.pantries.ids.include?(params[:id].to_i)
		@pantry = Pantry.find(params[:id])
	end

	def edit
		@user = current_user
		redirect_to user_path(current_user) unless current_user.id == Pantry.find(params[:id]).creator_id
		@pantry = Pantry.find(params[:id])
		# you have to update the pantry here
		respond_to do |format|
			format.js do
				render nothing: true
			end
			format.any do
				redirect_to user_path(@user)
			end
		end
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
		@user = current_user
		@pantry = Pantry.find(params[:id])
		@pantry.destroy
		respond_to do |format|
      format.js do
        render nothing: true
      end
      format.any do
        redirect_to user_path(@user)
      end
    end
	end

		private

	def pantry_params
		params.require(:pantry).permit(:name, :creator_id)
	end
end
