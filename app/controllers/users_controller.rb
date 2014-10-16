class UserController < ApplicationController

	def show
		show_door
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

	def edit

	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(user_params)
		redirect_to user_path
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to
	end

	def login_form
	end

	def login
		@user = User.find_by_email(params[:email])
    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
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

end
