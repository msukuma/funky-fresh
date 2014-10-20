class InvitesController < ApplicationController


  def create
    @invite = Invite.new(invite_params)
    @user = User.find_by_id(session[:user_id])
    
    set_sender_id(@invite)

    @pantry = Pantry.find_by_id(invite_params[:pantry_id])
    @recipient = User.find_by_email(@invite.email)

    if is_a_user?(@invite) && @recipient.has_pantry?(@pantry)
      flash[:notice] = "#{@invite.email} is already a part of your pantry."
    elsif is_a_user?(@invite) && !@recipient.has_pantry?(@pantry)      
      InviteMailer.existing_user_invite(@invite).deliver 
      @invite.recipient.pantries.push(@invite.pantry)
    else
      InviteMailer.new_user_invite(@invite, new_user_path(:invite_token => @invite.token)).deliver   
    end      
    redirect_to user_path(@user)
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

