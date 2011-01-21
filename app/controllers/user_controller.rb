class UserController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :update]
  

  def show
    @user = User.find_by_username(params[:username])
    @word_set = WordSet.new
  end
  
  def dashboard
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user]) if !params[:user][:words]
    flash[:message] = "TODO"
    redirect_to edit_user_path(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

end