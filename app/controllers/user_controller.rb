class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def dashboard
    
  end
  
  def update
    @user = User.find(params[:id])
    @user.add_description_set(params[:user][:words]) if params[:user][:words]
    @user.update_attributes(params[:user])
    flash[:message] = "TODO"
    redirect_to user_path(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end

end