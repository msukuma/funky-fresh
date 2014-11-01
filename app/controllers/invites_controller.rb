class InvitesController < ApplicationController
  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.create!(invite_params)
    set_sender_id(@invite)
    @user = User.find_by_id(session[:user_id])
    @recipient = User.find_by_email(invite_params[:email])
    @invite.invite_sort_n_send(@recipient)

    respond_to do |format|
      format.html {redirect_to user_path(@user)}
      format.json {render json: {:pantry => @pantry}}
      format.js { render nothing: true   }
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email, :pantry_id)
  end

  def set_sender_id(invite)
    user = current_user
    invite.sender_id = user.id
    invite.save
  end

end

