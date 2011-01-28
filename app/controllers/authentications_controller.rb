class AuthenticationsController < ApplicationController

  require 'open-uri'
  require 'mechanize'

  def create
    omniauth = request.env["rack.auth"]
    user = User.find_by_fb_uid(omniauth['uid'])
    puts "USER: " + user.to_yaml
    puts request.env["rack.auth"].to_yaml
   
    if user #if facebook user already is registered in 5palabritas
       flash[:notice] = "Te has conectado con tu cuenta de facebook, ahora comparte tu enlace con tus amigos para que te describan en 5 palabritas..."
       user.last_access_token = omniauth['credentials']['token']
       user.save
       sign_in_and_redirect(:user, user)
   else #einen user mit der uid gibt es noch nicht
     all_values_valid = true
     username = omniauth["user_info"]["nickname"]
     email = omniauth["extra"]["user_hash"]["email"]
     if User.find_by_username(username) || username.match(/profile/)
       all_values_valid = false
       username = ""
     end
     if User.find_by_email(email) || email.blank?
       all_values_valid = false
       email = "elige_un_mail_"+(0...8).map{65.+(rand(25)).chr}.join
     end
     
     
     user = User.new(:display_name => omniauth["user_info"]["name"],
                     :username => username,
                     :email => email,
                     :auth_type => "facebook",
                     :password => "facebook",
                     :password_confirmation => "facebook",
                     :fb_uid => omniauth['uid'],
                     :last_access_token => omniauth['credentials']['token'],
                     :all_values_valid => all_values_valid
                      )

     if user.save(:validate => false)
       flash[:notice] = "Felicitaciones! Te has registrado con tu cuenta de facebook, ahora comparte tu enlace con tus amigos para que te describan en 5 palabritas..."

       unless user.username = ""
         #Share on Wall
         fb_user = FbGraph::User.me(user.last_access_token).fetch
         fb_user.feed!(
           :message => I18n.t("facebook.wall_post_after_sign_up.message"),
           :picture => HOST + user.avatar.url(:medium),
           :link => HOST + user.username,
           :name => I18n.t("facebook.wall_post_after_sign_up.name"),
           :description => I18n.t("facebook.wall_post_after_sign_up.description")
         )
         #end SHARE ON FACEBOOK
      end
       
       pic_url = FbGraph::User.me(user.last_access_token).fetch.picture
       mechanize = WWW::Mechanize.new
       mechanize.get(pic_url+"?type=large")
       fb_profile_pic_url = mechanize.history[0].uri.to_s
       user.avatar = do_download_remote_image(fb_profile_pic_url)
       user.save
       sign_in_and_redirect(:user, user)
     else
      raise "user couldnt be saved"
     end
   end
   
  end



  def do_download_remote_image(image_url)
    io = open(URI.parse(image_url))
    def io.original_filename; base_uri.path.split('/').last; end
    io.original_filename.blank? ? nil : io
  rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
  end


end
