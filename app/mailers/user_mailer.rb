class UserMailer < ActionMailer::Base
  default :from => "5palabritas.com <info@5palabritas.com>"

  def welcome_email(user, password)
    @user = user
    @url  = user.permalink
    @password = password
    mail(:to => user.email,
         :subject => "5palabritas.com - ¡bienvenidos!")
  end


  def new_comment_on_your_word_set(word_set)
    @user = word_set.sender #hat versendet, kriegt jetzt kommentar
    @replier_name = word_set.receiver.display_name # hat kommentar gegeben
    @url  = word_set.receiver.permalink

    mail(:to => @user.email,
         :subject => "5palabritas.com - #{@replier_name} te ha dado un comentario!")
  end

  def new_word_set(user)
    @user = user
    @url  = user.permalink

    mail(:to => user.email,
         :subject => "5palabritas.com - ¡Tienes palabritas nuevas!")
  end


end
