class UserMailer < ActionMailer::Base
  default from: "refrigeratory@gmail.com"

  def welcome_email(user)
  	@user = user
  	# need a default @url, e.g. 'http://refrigeratory.herokuapp.com'
  	mail(to: @user.email, subject: 'Welcome to Refrigeratory!')
  end
end
