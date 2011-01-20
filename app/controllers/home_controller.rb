class HomeController < ApplicationController
  
  before_filter :redirect_if_logged_in, :only => [:index]


  def index
    @user = User.new
  end



  protected
    def redirect_if_logged_in
      redirect_to user_root_path if current_user
    end

end
