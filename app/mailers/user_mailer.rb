class UserMailer < ActionMailer::Base
  default from: "Funky||Fresh <no-reply@funky||fresh.com>"

  def welcome_email(user)
  	@user = user
  	# need a default @url, e.g. 'http://refrigeratory.herokuapp.com'
  	mail(to: @user.email, subject: 'Welcome to Funky||Fresh!')
  end



  def expiration_alert_email(user)
  	@user_pantries = {}
  	@user = user
  	@user.all_pantries.each do |pantry|
  		@user_pantries[pantry.name] = pantry.item_checker(5)
  	end
  	@user_pantries
  	mail(to: @user.email, subject: "Food expiration alert from your friends at Funky||Fresh")
  end
end
