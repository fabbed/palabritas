class AuthenticationsController < ApplicationController

  def create
    
    omniauth = request.env["rack.auth"]

    user = User.find_by_fb_uid(omniauth['uid'])
   
    if user
       flash[:notice] = "Signed in via facebook, existing user."
       sign_in_and_redirect(:user, user)
   else
     user = User.new(:display_name => omniauth["user_info"]["name"],
                     :username =>omniauth["user_info"]["nickname"],   #TODO: What if already taken? oder es keinen gibt?
                     :email => omniauth["extra"]["user_hash"]["email"],
                     :auth_type => "facebook",
                     :password => "facebook",
                     :password_confirmation => "facebook",
                     :fb_uid => omniauth['uid']
                      )
     if user.save
       flash[:notice] = "new user created."
       sign_in_and_redirect(:user, user)
     else
      raise "user couldnt be saved"
     end
   end
   




    # flash[:notice] = "Signed in via facebook."
    # 
    # redirect_to user_root_path
  end


end
