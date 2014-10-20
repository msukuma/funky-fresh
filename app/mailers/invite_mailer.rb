class InviteMailer < ActionMailer::Base
  default from: "Funky||Fresh <no-reply@funky||fresh.com>"

  def existing_user_invite(invite)
    @invite = invite

    mail(to: @invite.email, subject: 'Pantry invitation @ Funky||Fresh!')
  end

  def new_user_invite(invite, url)
    @url = url
    @invite = invite
    # need a default @url, e.g. 'http://refrigeratory.herokuapp.com'
    mail(to: @invite.email, subject: 'You are invited to Funky||Fresh!')
  end

end