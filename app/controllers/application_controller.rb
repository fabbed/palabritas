class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :export_i18n_messages

  # user_path

  #TODO: overwrote this path to show palabritas de prev logged in unser
  
  # private
  # 
  # # Overwriting the sign_out redirect path method
  # def after_sign_out_path_for(resource_or_scope)
  #   root_path
  # end

  private
    def export_i18n_messages
      SimplesIdeias::I18n.export! if Rails.env.development?
    end


end
