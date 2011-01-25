class AuthenticationsController < ApplicationController

  require 'open-uri'
  require 'mechanize'

  def create
    omniauth = request.env["rack.auth"]
    user = User.find_by_fb_uid(omniauth['uid'])
   
    if user #if facebook user already is registered in 5palabritas
       flash[:notice] = "Signed in via facebook, existing user."
       user.last_access_token = omniauth['credentials']['token']
       user.save
       sign_in_and_redirect(:user, user)
   else
     user = User.new(:display_name => omniauth["user_info"]["name"],
                     :username =>omniauth["user_info"]["nickname"],   #TODO: What if already taken? oder es keinen gibt? do: set all_values_valid to false, redirect to preferences where username can be changed, dont let him navigate away until changed
                     :email => omniauth["extra"]["user_hash"]["email"],
                     :auth_type => "facebook",
                     :password => "facebook",
                     :password_confirmation => "facebook",
                     :fb_uid => omniauth['uid'],
                     :last_access_token => omniauth['credentials']['token'],
                     :all_values_valid => true
                      )

     if user.save
       flash[:notice] = "new user created."
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
