class InvitesController < ApplicationController
  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)
    @user = User.find_by_id(session[:user_id])
    @invite.sender_id = @user.id
    @recipient = User.find_by_email(invite_params[:email])

    if is_a_user?(@invite) && @recipient.has_pantry?(@pantry)
      flash[:notice] = "#{@invite.email} is already a part of your pantry."
    elsif is_a_user?(@invite) && !@recipient.has_pantry?(@pantry)
      InviteMailer.existing_user_invite(@invite).deliver
      @invite.recipient.pantries.push(@invite.pantry)
    else
      InviteMailer.new_user_invite(@invite, 'http://localhost:3000'+root_path(:invite_token => @invite.token)).deliver
    end

    respond_to do |format|
      format.html {redirect_to user_path(@user)}
      format.json {render json: {:pantry => @pantry}}
      format.js { render nothing: true   }
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email, :pantry_id, :sender_id, :recipient_id, :token)
  end

  def set_sender_id(invite)
    user = User.find_by_id(session[:user_id])
    invite.sender_id = user.id
    invite.save
  end

  def is_a_user?(invite)
    recipient = User.find_by_email(invite.email)
    return true if recipient
  end
end

