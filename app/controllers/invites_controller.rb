class InvitesController < ApplicationController
  def new
    puts "what is up this the new method"
    @invite = Invite.new
  end

  def create
    puts "CREATING TOKEN DUDE"
    @invite = Invite.create!(invite_params)
    set_sender_id(@invite)

    puts @invite 
    puts @invite.email
    puts @invite.sender_id
    puts "I am the token: #{@invite.token}" 

    @user = User.find_by_id(session[:user_id])
    @recipient = User.find_by_email(invite_params[:email])

    if is_a_user?(@invite) && @recipient.has_pantry?(@pantry)
      flash[:notice] = "#{@invite.email} is already a part of your pantry."
    elsif is_a_user?(@invite) && !@recipient.has_pantry?(@pantry)
      puts "found an existing user"
      InviteMailer.existing_user_invite(@invite).deliver
      @invite.recipient.pantries.push(@invite.pantry)
    else
      puts "found a new user"
      InviteMailer.new_user_invite(@invite, 'http://localhost:3000' + new_user_path(:invite_token => @invite.token)).deliver
    end

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

  def is_a_user?(invite)
    !!User.find_by_email(invite.email)
  end

end

