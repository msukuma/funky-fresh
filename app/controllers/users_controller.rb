class UsersController < ApplicationController
	before_action :show_door, except: [:login_form, :login, :new, :create]
	before_action :find_user, only: [:show, :edit, :update, :destroy]

	def show
    redirect_to user_path(current_user) unless current_user.id.to_s == params[:id]
		@user = User.find(params[:id])
    respond_to do |format|
      format.html
    end
	end

	def new
    puts "!~~~~~~~~~~~New PARAMS~~~~~~~~~~~~~~~~!"
    puts params
    @token = params[:invite_token]
    puts "new found the TOKEN: #{@token}"
		redirect_to user_path(current_user) if current_user
		@user = User.new
	end

  def edit
    redirect_to user_path(current_user) unless current_user.id.to_s == params[:id]
  end

	def create
		@user = User.new(user_params)
    @token = params[:invite_token]
    puts "I am the TOKEN"
    puts @token
    if @user
      if @token != nil
      puts "TOKEN IS NOT NILL ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      pantry_id = Invite.find_by_token(@token).pantry_id
      puts "pantry_id #{pantry_id}"
      pantry = Pantry.find_by_id(pantry_id)
      puts "pantry name: #{pantry.name}"
      @user.pantries.push(pantry)
      puts @user.pantries
      @user.save
      end
      puts "~~~~~~~~~~~~~~~~~~~TOKEN IS NILL!!!!!!!!!!"
      @user.save
      UserMailer.welcome_email(@user).deliver
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
		session.clear
		redirect_to root_path	#might need to change the path
	end

	def login_form
    respond_to do |format|
      format.js
    end
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
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

	# def find_user
 #    @user = User.find(params[:id])
 #  end

end
