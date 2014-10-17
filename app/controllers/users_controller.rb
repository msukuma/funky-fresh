class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update, :destroy]

	def show
		show_door unless session[:user_id] == params[:id] #reuse this
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create!(user_params)
    if @user
    	session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
	end

	def update
		if @user.update_attributes(user_params)
			redirect_to user_path
		else
			render 'edit'
		end
	end

	def destroy
		@user.destroy
		redirect_to root_path	#might need to change the path
	end

	def login_form
	end

	def login
		@user = User.find_by_email(params[:email])
    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render 'login_form'
      end
    else
      render 'login_form'
    end
	end

	def logout
		session.clear
		redirect_to root_path
	end

		private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end

	def find_user
    @user = User.find(params[:id])
  end

end
