class InvitesController < ApplicationController
  def new
    @invite = Invite.new
  end

  def create
    email_type = nil
    @invite = Invite.create!(invite_params)
    set_sender_id(@invite)
    @user = User.find_by_id(session[:user_id])
    @recipient = User.find_by_email(invite_params[:email])
    @invite.invite_sort_n_send(@recipient)

    if email_type = 'already a member'
      flash[:notice] = "#{@invite.email} is already a part of your pantry."
    elsif email_type = "invited existing member"
      flash[:notice] = "You've successfully invited #{@invite.email}."
    else
      flash[:notice] = "You've invited #{@invite.email} to join your pantry"
    end

    # if is_a_user?(@invite) && @recipient.has_pantry?(@pantry)
    #   flash[:notice] = "#{@invite.email} is already a part of your pantry."
    # elsif is_a_user?(@invite) && !@recipient.has_pantry?(@pantry)
    #   InviteMailer.existing_user_invite(@invite).deliver
    #   @invite.recipient.pantries.push(@invite.pantry)
    # else
    #   InviteMailer.new_user_invite(@invite, 'http://localhost:3000' + new_user_path(:invite_token => @invite.token)).deliver
    # end

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

