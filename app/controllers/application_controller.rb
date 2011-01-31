class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :export_i18n_messages
  before_filter :redirect_to_user_settings_if_username_is_already_taken_or_empty_when_signing_up_over_facebook
  before_filter :create_user_session


  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      if !resource_or_scope.signup_tracked
        resource_or_scope.update_attribute(:signup_tracked, true)
        user_root_path(:t => "signup", :mthd => resource_or_scope.auth_type)
      else
        user_root_path()
      end
    else
      super
    end
  end

  private
    def export_i18n_messages
      SimplesIdeias::I18n.export! if Rails.env.development?
    end

    def redirect_to_user_settings_if_username_is_already_taken_or_empty_when_signing_up_over_facebook
      if current_user && !current_user.all_values_valid && !((self.controller_name == "user" && self.action_name == "edit") || (self.controller_name == "user" && self.action_name == "update"))
        puts "REDIRECTION IN APPCON"
        
        flash[:notice] = I18n.t(".please_choose_a_username") if current_user.username.blank?
        flash[:notice] << I18n.t(".please_choose_a_different_email") if current_user.email.match(/elige_un_mail/)
        redirect_to edit_user_path(current_user)
      end
    end

    def create_user_session
      if !session[:user]
        session[:user] = {}
        session[:user][:blinking_counter] = 1
        session[:user][:described_users] = []
      end
    end


end
