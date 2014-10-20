class InvitesController < ApplicationController


  def create
    @invite = Invite.new(invite_params)
    puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    puts @invite
    puts "SESSION #{session[:user_id]}"
    @user = User.find_by_id(session[:user_id])
    @invite.sender_id = @user.id
    puts @invite.sender_id
    if @invite.save
      puts "!!!!!!!!!!!!!!!!!!!!!!!!"
      puts @invite
      if @invite.recipient != nil 
        InviteMailer.existing_user_invite(@invite).deliver 
        @invite.recipient.pantries.push(@invite.pantry)
      else
        puts "sending new email"
        InviteMailer.new_user_invite(@invite, new_user_path(:invite_token => @invite.token)).deliver
      end
    else
      flash[:notice] = "We are unable to send the email at this time."
    end

    redirect_to user_path(@user)
  end


  private

  def invite_params
    params.require(:invite).permit(:email, :pantry_id, :sender_id, :recipient_id, :token)
  end

end

