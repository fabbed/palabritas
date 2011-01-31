class UserMailer < ActionMailer::Base
  default :from => "info@5palabritas.com"

  def welcome_email(user)
    @user = user
    @url  = user.permalink
    mail(:to => user.email,
         :subject => "5palabritas.com - ¡bienvenidos!")
  end

  def new_word_set(user)
    @user = user
    @url  = user.permalink
    mail(:to => user.email,
         :subject => "5palabritas.com - ¡Tienes palabritas nuevas!")
  end


end
