class UserMailer < ActionMailer::Base
  default :from => "info@5palabritas.com"

  def welcome_email(user)
    @user = user
    @url  = user.permalink
    mail(:to => user.email,
         :subject => "Bienvenidos a 5palabritas.com")
  end


end
