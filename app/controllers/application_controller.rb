class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end

  # def logged_in
  #   current_user != nil
  # end

  def show_door
    redirect_to login_path if current_user == nil
  end

  # we should talk about setting a standard for finding the user
  # what is this used for?
  def find_user
    @user = params[:user_id] ? User.find(params[:user_id]) : User.find(params[:id])
  end
end
