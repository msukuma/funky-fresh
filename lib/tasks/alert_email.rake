desc 'send daily expiration alert email'
	task :alert_email => :environment do |task|
		User.all.each do |user|
			UserMailer.expiration_alert_email(user).deliver
		end
	end