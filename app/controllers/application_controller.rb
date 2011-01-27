class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :export_i18n_messages
  before_filter :redirect_to_user_settings_if_username_is_already_taken_or_empty_when_signing_up_over_facebook



  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      user_root_path(resource_or_scope)
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
        
        flash[:notice] = I18n.t(".please_choose_a_username")
        redirect_to edit_user_path(current_user)
      end
    end

end
